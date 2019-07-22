import 'package:flutter_movies_bloc/models/trailer_item.dart';
import 'package:flutter_movies_bloc/resources/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieDetailBloc {
  final _movieRepository = MovieRepository();
  final _trailers = PublishSubject<TrailerItem>();

  Observable<TrailerItem> get movieTrailers => _trailers.stream;

  dispose() {
    _trailers.close();
  }

  getMovieTrailersById(int movieId) async {
    TrailerItem videos = await _movieRepository.getVideos(movieId);
    _trailers.sink.add(videos);
  }

}