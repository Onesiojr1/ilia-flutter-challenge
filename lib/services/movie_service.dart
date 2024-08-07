import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ilia_flutter_challenge/model/genre.dart';
import 'package:ilia_flutter_challenge/model/movie.dart';
import 'package:ilia_flutter_challenge/model/movie_videos.dart';

const accessTokenAuth = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMjkxNWI3YmI2ZGUzMDkyODZmZmUzYmRkZGRiMTdhYiIsIm5iZiI6MTcyMjg4Njg4MC45MDk0MjIsInN1YiI6IjY2YjExZTgxMzUzN2MxN2FiY2M2MDgzMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Ptk2Z3bFqM_9sI3-Xpl8V9Sgwvmt3CbPNRya2yM9Lb4';

class MovieService {
  final client = http.Client();
  final baseUrl = 'https://api.themoviedb.org/3';

   Future<MovieResponse> getMovies({int page = 1}) async {
    try {
      final uri = Uri.parse('$baseUrl/movie/now_playing?language=en-US&page=$page&sort_by=popularity.desc');

      final response = await client.get(
        uri, 
        headers: {
          'Authorization': 'Bearer $accessTokenAuth',
          'accept': 'application/json',
        },
      );

      return MovieResponse.fromJson(json.decode(response.body));
    } catch(e) {
      throw Error();
    }
  }

  Future<List<Genre>?> getAllGenre() async {
    try{
      final uri = Uri.parse('$baseUrl/genre/movie/list');

      final response = await client.get(
        uri, 
        headers: {
          'Authorization': 'Bearer $accessTokenAuth',
          'accept': 'application/json',
        },
      );

      return List<Genre>.from(json.decode(response.body)['genres'].map((genre) => Genre.fromJson(genre)));

    } catch(e) {
      throw Error();
    }
  }

  Future<VideoResponse> getTrailer(int id) async {
    try {
      final uri = Uri.parse('$baseUrl/movie/$id/videos');

      final response = await client.get(
        uri, 
        headers: {
          'Authorization': 'Bearer $accessTokenAuth',
          'accept': 'application/json',
        },
      );
      return VideoResponse.fromJson(json.decode(response.body));

    } catch (e){
      throw Error();
    }
  }

  Future<MovieResponse> searchMovie(String query) async {
    final uri = Uri.parse('$baseUrl/search/movie?query=$query');

    final response = await client.get(
        uri, 
        headers: {
          'Authorization': 'Bearer $accessTokenAuth',
          'accept': 'application/json',
        },
      );

      return MovieResponse.fromJson(json.decode(response.body));
  }
}