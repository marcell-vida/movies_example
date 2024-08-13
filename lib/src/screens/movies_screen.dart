import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_example_app/src/blocs/movies_bloc.dart';
import 'package:movies_example_app/src/screens/movie_detail_screen.dart';
import 'package:movies_example_app/src/utils/constants.dart';
import 'package:movies_example_app/src/widgets/movie_card.dart';

import '../utils/get_it.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Locator.setup(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(Locator.loc.moviesScnMovies),
              centerTitle: true,
            ),
          ),
          SliverPersistentHeader(
            floating: true,
            delegate: _SearchBarDelegate(),
          ),
          BlocBuilder<MoviesBloc, MoviesState>(
            bloc: Locator.moviesBloc,
            builder: (context, state) {
              if (state is MoviesLoaded) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final movie = state.movies[index];
                      return MovieTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  MovieDetailScreen(movie: movie)));
                        },
                        movie: movie,
                      );
                    },
                    childCount: state.movies.length,
                  ),
                );
              }

              return const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SearchBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightGray,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: TextField(
          onSubmitted: (query) {
            Locator.moviesBloc.add(ClickedSearch(query));
          },
          decoration: InputDecoration(
            hintText: Locator.loc.moviesScnSearch,
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 60.0;

  @override
  double get minExtent => 60.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
