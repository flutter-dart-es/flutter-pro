import 'package:flutter_movies_bloc/models/movie_item.dart';
import 'package:flutter_movies_bloc/resources/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final _movieRepository = MovieRepository();
  final _movies = PublishSubject();

  // sink / stream

  Observable<MovieItem> get popularMovies => _movies.stream;

  getPopularMovies() async {
    MovieItem movieItem = await _movieRepository.getPopularMovies();
    _movies.sink.add(movieItem);
  }

  dispose() {
    _movies.close();
  }
}