import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_list_search/controllers/movie_controllers.dart';
import 'movie_detail_page.dart';

class MovieListPage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  MovieListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final movieController = Get.find<MovieController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movies',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Movies',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    String query = _searchController.text.trim();
                    if (query.isNotEmpty) {
                      movieController.fetchMovies(query);
                    }
                  },
                ),
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  movieController.fetchMovies(value);
                }
              },
            ),
          ),
          Obx(() {
            if (movieController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            return Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: movieController.moviesList.length,
                itemBuilder: (context, index) {
                  final movie = movieController.moviesList[index];
                  return GestureDetector(
                    onTap: () {
                      movieController.fetchMovieDetails(movie.imdbID ?? '');
                      Get.to(() => const MovieDetailPage());
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16)),
                            child: movie.poster == "N/A"
                                ? const Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: Text(
                                      "No Image Found",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.red),
                                    ),
                                  )
                                : Image.network(
                                    movie.poster ?? '',
                                    fit: BoxFit.cover,
                                    height: 150,
                                    width: double.infinity,
                                  ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              movie.title ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              movie.year ?? '',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
