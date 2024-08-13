import 'dart:ui';

class Constants{
  static const String apiKey = 'd30cc88bc0168c4e5a9385783eb9fe3f';
  static const String moviesUrl = 'https://api.themoviedb.org/3';
  static const String postersUrl = 'https://image.tmdb.org/t/p/w500';
  static const String accessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkMzBjYzg4YmMwMTY4YzRlNWE5Mzg1NzgzZWI5ZmUzZiIsInN1YiI6IjYzYWZlZThmNTc1MzBlMDA4NTAxMjdkMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.wrRM0IPSBjbFO-CcvxU5GsyuHeatUlZlpgV5d3TANLw';

  static const fullMoviesUrl = '$moviesUrl/movie/popular?api_key=$apiKey';
}

class AppColors{
  static const primaryColor = Color(0xFF1A1A1A);
  static const secondaryColor = Color(0xFF2B2B2B);
  static const accentColor = Color(0xFFE50914);
  static const whiteColor = Color(0xFFFFFFFF);
  static const blackColor = Color(0xFF000000);
  static const lightGray = Color(0xFFE5E5E5);
}