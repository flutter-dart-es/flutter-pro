import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/trailer_item.dart';
import '../resources/movie_api_provider.dart';

class MovieDetail extends StatefulWidget {
  final posterUrl;
  final description;
  final releaseDate;
  final String title;
  final String voteAverage;
  final int movieId;

  MovieDetail({
    this.title,
    this.posterUrl,
    this.description,
    this.releaseDate,
    this.voteAverage,
    this.movieId
  });

  @override
  _MovieDetailState createState() => _MovieDetailState(
    title: title,
    posterUrl: posterUrl,
    description: description,
    releaseDate: releaseDate,
    voteAverage: voteAverage,
    movieId: movieId
  );
}

class _MovieDetailState extends State<MovieDetail> {
  MovieApiProvider api;

  final posterUrl;
  final description;
  final releaseDate;
  final String title;
  final String voteAverage;
  final int movieId;

  _MovieDetailState({
    this.title,
    this.posterUrl,
    this.description,
    this.releaseDate,
    this.voteAverage,
    this.movieId
  });

  @override
  Widget build(BuildContext context) {
    api = new MovieApiProvider();

    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 200.0,
                  elevation: 0.0,
                  floating: false,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                        'https://image.tmdb.org/t/p/w500${posterUrl}',
                        fit: BoxFit.cover
                    )
                  ),
                )
              ];
            }
            , body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title, style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold
                  )),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.yellow
                      ),
                      Text(
                        voteAverage,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.yellow
                        )
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.0),
                      ),
                      Text(
                        releaseDate,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontStyle: FontStyle.italic
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                  ),
                  Text(description),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                  ),
                  Text(
                    "Trailers",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  FutureBuilder<TrailerItem>(
                    future: api.getVideos(movieId),
                    builder: (context, trailerSnapshot) {
                      if(trailerSnapshot.hasData) {
                        if(trailerSnapshot.data.results.length > 0) {
                          // Tenemos al menos 1 trailer
                          return trailerLayout(trailerSnapshot.data);
                        } else {
                          // No tenemos ningún trailer
                          return noTrailer(trailerSnapshot.data);
                        }
                      } else {
                        return Center(child:
                          CircularProgressIndicator()
                        );
                      }
                    }
                  )
                ],
              ),
        )
        ),
      )
    );
  }

  Widget noTrailer(TrailerItem data) {
    return Center(
      child:
        Text('No hay trailers')
    );
  }

  Widget trailerLayout(TrailerItem data) {

  }
}
