import 'package:flutter/material.dart';
import 'package:movies_example_app/src/models/movie.dart';
import 'package:movies_example_app/src/utils/constants.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                movie.fullPosterPath,
                fit: BoxFit.cover,
              ),
              Positioned(
                  bottom: 0,
                  left: 20,
                  right: 0,
                  top: 20,
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios))),
              Positioned(
                bottom: 20,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, top: 40, bottom: 8.0, right: 14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: TextStyle(color: AppColors.whiteColor, fontSize: 24),
                      ),
                      // Text(
                      //   movie.releaseDate,
                      //   style: Theme.of(context).textTheme.subtitle,
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.overview,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
