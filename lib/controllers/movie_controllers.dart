import 'package:get/get.dart';
import 'package:movie_list_search/models/movie_details_model.dart';
import 'package:movie_list_search/models/movie_list_model.dart';
import 'package:movie_list_search/services/api_service.dart';

class MovieController extends GetxController {
  var isLoading = false.obs;
  var moviesList = <MovieListModel>[].obs;
  var selectedMovie = Rx<MovieDetailsModel?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchMovies("Avengers");
  }

  void fetchMovies(String query) async {
    isLoading(true);
    try {
      var movies = await MovieApiService.fetchMovies(query);
      if (movies != null) {
        moviesList.assignAll(movies);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load movies');
    } finally {
      isLoading(false);
    }
  }

  void fetchMovieDetails(String imdbID) async {
    isLoading(true);
    try {
      var movieDetails = await MovieApiService.fetchMovieDetails(imdbID);
      selectedMovie.value = movieDetails;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load movie details');
    } finally {
      isLoading(false);
    }
  }
}
