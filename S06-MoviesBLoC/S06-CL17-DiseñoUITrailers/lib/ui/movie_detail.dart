import 'package:flutter/material.dart';
import 'package:flutter_movies_bloc/blocs/movie_detail_bloc.dart';
import 'package:flutter_movies_bloc/models/trailer_item.dart';
import 'package:url_launcher/url_launcher.dart';

import '../resources/movie_detail_bloc_provider.dart';

class MovieDetail extends StatefulWidget {
  final posterUrl;
  final description;
  final releaseDate;
  final String title;
  final double voteAverage;
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
  MovieDetailBloc bloc;

  final posterUrl;
  final description;
  final releaseDate;
  final String title;
  final double voteAverage;
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
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bloc = MovieDetailBlocProvider.of(context);
    bloc.getMovieTrailersById(movieId);

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
                        voteAverage.toString(),
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
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                ),
                StreamBuilder(
                  stream: bloc.movieTrailers,
                  builder: (context, AsyncSnapshot<TrailerItem> snapshot) {
                    if(snapshot.hasData) {
                      if(snapshot.data.results.length > 0) {
                        return trailerLayout(snapshot.data);
                      } else {
                        return noTrailer(snapshot.data);
                      }
                    } else {
                      return Center(child: CircularProgressIndicator());
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
    if(data.results.length > 1) {
      // Si al menos hay 2 vídeos
      return Row(
        children: <Widget>[
          trailerItemLayout(data, 0),
          trailerItemLayout(data, 1)
        ],
      );
    } else {
      // Sólo tenemos 1 trailer
      return Row(
        children: <Widget>[
          trailerItemLayout(data, 0)
        ],
      );
    }
  }

  trailerItemLayout(TrailerItem data, int i) {
    return Expanded(
        child:
        Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5.0),
              height: 100.0,
              color: Colors.grey,
              child: Center(
                child:
                IconButton(
                    icon: Icon(Icons.play_circle_filled),
                    onPressed: () {
                      _verVideo(data.results[i].key, data.results[i].site);
                    }
                ),
              ),
            ),
            Text(
              data.results[i].name,
              maxLines: 1,
              overflow: TextOverflow.fade,
            )
          ],
        )
    );
  }

  Future _verVideo(String key, String site) async {
    String videoBaseUrl = '';
    if(site == 'YouTube') {
      videoBaseUrl = 'https://www.youtube.com/watch?v=';
    } else {
      videoBaseUrl = 'https://vimeo.com/';
    }

    String url = videoBaseUrl + key;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se ha podido abrir la url del vídeo';
    }
  }

}
