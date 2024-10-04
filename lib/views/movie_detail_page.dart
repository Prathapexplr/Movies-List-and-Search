import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_list_search/controllers/movie_controllers.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final movieController = Get.find<MovieController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movie Details',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (movieController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final movie = movieController.selectedMovie.value;
        if (movie == null) {
          return const Center(child: Text('Movie details not available'));
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: movie.poster == "N/A"
                      ? const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "No Image Found",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, color: Colors.red),
                          ),
                        )
                      : Image.network(
                          movie.poster ?? '',
                          fit: BoxFit.cover,
                          height: 150,
                          width: double.infinity,
                        ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                movie.title ?? '',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Release Year: ${movie.year}',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              const SizedBox(height: 8),
              Text(
                'Rating: ${movie.imdbRating ?? 'N/A'}',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              const SizedBox(height: 16),
              const Text(
                'Plot:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 8),
              Text(
                movie.plot ?? 'No plot available',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Cast:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 8),
              Text(
                movie.actors ?? 'N/A',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        );
      }),
    );
  }
}
