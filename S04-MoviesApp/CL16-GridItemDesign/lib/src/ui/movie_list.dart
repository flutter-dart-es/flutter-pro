import 'package:flutter/material.dart';
import 'package:movies_app/src/models/movie_item.dart';
import 'package:movies_app/src/resources/movie_api_provider.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  MovieApiProvider api;

  @override
  void initState() {
    super.initState();
    api = new MovieApiProvider();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieItem>(
          future: api.getMovieList(),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return buildMovieGrid(snapshot);
            } else if(snapshot.hasError) {
              return Text(snapshot.error.toString());
            }

            return Center(
              child: CircularProgressIndicator()
            );
          }
    );
  }

  Widget buildMovieGrid(AsyncSnapshot<MovieItem> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.results.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.7
        ),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: Image.network(
                'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].poster_path}',
              fit: BoxFit.cover,
            )
          );
        }
    );
  }
}
