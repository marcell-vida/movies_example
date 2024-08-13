import 'package:movies_example_app/src/extensions/map_extension.dart';

import '../utils/constants.dart';

class MovieFields {
  static const String id = 'id';
  static const String title = 'title';
  static const String overview = 'overview';
  static const String posterPath = 'poster_path';
  static const String rating = 'vote_average';
  static const String likes = 'vote_count';
}

class Movie {
  final int id;
  final String title;
  final String overview;
  final String _posterPath;
  final double rating;
  final int likes;

  Movie( {required this.id, required this.title, required this.overview, required String posterPath, required this.rating, required this.likes,}) : _posterPath = posterPath;

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json.get<int>(MovieFields.id) ?? -1,
      title: json.get<String>(MovieFields.title) ?? '',
      overview: json.get<String>(MovieFields.overview) ?? '',
      posterPath: json.get<String>(MovieFields.posterPath) ?? '',
      rating: json.get<double>(MovieFields.rating) ?? 0.0,
      likes: json.get<int>(MovieFields.likes) ?? 0,
    );
  }

  String get fullPosterPath => '${Constants.postersUrl}$_posterPath';

}