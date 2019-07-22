import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/src/models/movie_item.dart';

class MovieApiProvider {
  final _apiKey = "6f98f87d1c79abf7c5693a8b0771b01f";
  final _baseUrl = "https://api.themoviedb.org/3";

  Future<MovieItem> getMovieList() async {
    final urlPopularMovies = '$_baseUrl/movie/popular?api_key=$_apiKey';

    final response = await http.get(urlPopularMovies);

    if(response.statusCode == 200) {
      return MovieItem.fromJson(json.decode(response.body));
    } else {
      throw Exception('Fallo al obtener el listado de películas');
    }

  }

}