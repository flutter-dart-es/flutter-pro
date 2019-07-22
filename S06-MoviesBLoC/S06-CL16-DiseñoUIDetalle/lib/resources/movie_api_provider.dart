import 'dart:convert';
import 'package:flutter_movies_bloc/models/movie_item.dart';
import 'package:flutter_movies_bloc/models/trailer_item.dart';
import 'package:http/http.dart';

class MovieApiProvider {
  Client http = Client();
  final _baseUrl = "https://api.themoviedb.org/3/movie";
  final _apiKey = "6f98f87d1c79abf7c5693a8b0771b01f";
  
  Future<MovieItem> getPopularMovies() async {
    final response = await http.get("$_baseUrl/popular?api_key=$_apiKey");

    if(response.statusCode == 200) {
      return MovieItem.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error al obtener películas populares');
    }

  }

  Future<TrailerItem> getVideos(int movieId) async {
    final response = await http.get("$_baseUrl/$movieId/videos?api_key=$_apiKey");

    if(response.statusCode == 200) {
      return TrailerItem.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error al obtener los vídeos de la película');
    }
  }
}