import 'package:flutter/material.dart';
import 'package:movies_example_app/src/models/movie.dart';
import 'package:movies_example_app/src/widgets/text_with_icon.dart';

import '../utils/constants.dart';

class MovieTile extends StatelessWidget {
  final Movie movie;
  final void Function() onTap;

  const MovieTile({required this.movie, super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child:
        ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 200.0,
            maxHeight: 200.0,
          ),
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.bottomLeft ,
                  child: Container(
                    height: 160.0,
                    width: MediaQuery.of(context).size.width - 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: AppColors.lightGray,
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxHeight: 180.0,
                        ),
                        child: Image.network(
                          movie.fullPosterPath,
                          height: 180.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 40, bottom: 8.0, right: 14.0),
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Flexible(
                                child: Text(
                                  movie.title,
                                  style: Theme.of(context).textTheme.titleLarge,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Row(
                                children: [
                                  TextWithIcon(icon: Icons.star, text: movie.rating.toStringAsFixed(1), color: Colors.yellow),
                                  const SizedBox(width: 8.0),
                                  TextWithIcon(icon: Icons.favorite, text: movie.likes.toString(), color: Colors.red)
                                ],
                              ),
                              const SizedBox(height: 8.0),
                              Flexible(
                                child: Text(
                                  movie.overview,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
