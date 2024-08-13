import 'dart:convert';

import '../models/movie.dart';
import 'package:http/http.dart' as http;

import '../utils/constants.dart';


class MoviesRepository {
  static final MoviesRepository _instance = MoviesRepository._internal();

  MoviesRepository._internal();

  factory MoviesRepository() {
    return _instance;
  }

  Future<List<Movie>> getMovies([String? query]) async {
    final response = await http.get(
      Uri.parse(Constants.fullMoviesUrl + (query != null ? '&query=$query' : '')),
      headers: {
        'Authorization': 'Bearer ${Constants.accessToken}',
        'Content-Type': 'application/json;charset=utf-8',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<Movie> movies = List<Movie>.from(
          data['results'].map((x) => Movie.fromJson(x)));
      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}