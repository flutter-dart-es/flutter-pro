import 'package:flutter/material.dart';
import 'package:flutter_movies_bloc/blocs/movies_bloc.dart';
import 'package:flutter_movies_bloc/models/movie_item.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  MoviesBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = MoviesBloc();
    bloc.getPopularMovies();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies')
      ),
      body: StreamBuilder(
          stream: bloc.popularMovies,
          builder: (context, AsyncSnapshot<MovieItem> snapshot) {
            if(snapshot.hasData) {
              return buildMovieList(snapshot);
            } else if(snapshot.hasError) {
              return Text(snapshot.error.toString());
            }

            // en otro caso
            return Center(child: CircularProgressIndicator());
          }
      ),
    );
  }

  Widget buildMovieList(AsyncSnapshot<MovieItem> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.results.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: InkResponse(
              enableFeedback: true,
              child: Image.network(
                'https://image.tmdb.org/t/p/w185${snapshot.data
                    .results[index].posterPath}',
                fit: BoxFit.cover,
              ),
              onTap: () => openDetailPage(snapshot.data, index),
            ),
          );
        });
  }

  openDetailPage(MovieItem data, int index) {}
}
