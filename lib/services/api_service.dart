import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_list_search/models/movie_details_model.dart';
import 'package:movie_list_search/models/movie_list_model.dart';

class MovieApiService {
  static const String apiKey = 'c6f0db52';
  static const String baseUrl = 'http://www.omdbapi.com/';

  static Future<List<MovieListModel>?> fetchMovies(String query) async {
    final response =
        await http.get(Uri.parse('$baseUrl?s=$query&apikey=$apiKey'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['Search'] != null) {
        return (data['Search'] as List)
            .map((movie) => MovieListModel.fromJson(movie))
            .toList();
      }
    }
    return null;
  }

  static Future<MovieDetailsModel?> fetchMovieDetails(String imdbID) async {
    final response =
        await http.get(Uri.parse('$baseUrl?i=$imdbID&apikey=$apiKey'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return MovieDetailsModel.fromJson(data);
    }
    return null;
  }
}
