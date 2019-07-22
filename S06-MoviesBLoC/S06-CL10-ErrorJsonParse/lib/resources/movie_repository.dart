import 'package:flutter_movies_bloc/models/movie_item.dart';

import 'movie_api_provider.dart';

class MovieRepository {
  final movieApiProvider = MovieApiProvider();

  Future<MovieItem> getPopularMovies() => movieApiProvider.getPopularMovies();
}