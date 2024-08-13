import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_example_app/src/utils/get_it.dart';

import '../models/movie.dart';
import '../repositories/movies_repository.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class MoviesInit extends MoviesState {}

class MoviesLoading extends MoviesState {}

class MoviesLoaded extends MoviesState {
  final List<Movie> movies;

  const MoviesLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class ClickedSearch extends MoviesEvent {
  final String query;

  const ClickedSearch(this.query);

  @override
  List<Object> get props => [query];
}

class InitMovies extends MoviesEvent {

  const InitMovies();

  @override
  List<Object> get props => [];
}

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesRepository moviesRepository = Locator.moviesRepo;

  MoviesBloc() : super(MoviesInit()) {
    on<ClickedSearch>(_onClickedSearch);
    on<InitMovies>(_onInitMovies);
    add(const InitMovies());
  }

  Future<void> _onInitMovies(InitMovies event, Emitter<MoviesState> emit) async {
    emit(MoviesLoading());
    try {
      final movies = await moviesRepository.getMovies();
      emit(MoviesLoaded(movies));
    } catch (_) {
      emit(MoviesInit()); // Handle error state appropriately
    }
  }

  Future<void> _onClickedSearch(ClickedSearch event,
      Emitter<MoviesState> emit) async {
    emit(MoviesLoading());
    try {
      final movies = await moviesRepository.getMovies(event.query);
      emit(MoviesLoaded(movies));
    } catch (_) {
      emit(MoviesInit()); // Handle error state appropriately
    }
  }
}
