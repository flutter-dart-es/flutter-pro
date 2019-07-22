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
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies')
      ),
      body: FutureBuilder<MovieItem>(
          future: api.getMovieList(),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              //TODO: listar películas
            } else if(snapshot.hasError) {
              return Text(snapshot.error.toString());
            }

            return Center(
              child: CircularProgressIndicator()
            );
          }
      )
    );
  }
}
