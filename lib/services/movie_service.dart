import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ilia_flutter_challenge/model/genre.dart';
import 'package:ilia_flutter_challenge/model/movie.dart';

const accessTokenAuth = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMjkxNWI3YmI2ZGUzMDkyODZmZmUzYmRkZGRiMTdhYiIsIm5iZiI6MTcyMjg4Njg4MC45MDk0MjIsInN1YiI6IjY2YjExZTgxMzUzN2MxN2FiY2M2MDgzMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Ptk2Z3bFqM_9sI3-Xpl8V9Sgwvmt3CbPNRya2yM9Lb4';
var client = http.Client();

class MovieService {
   Future<List<Movie>?> getPopularMovies() async {
    try {
      final uri = Uri.parse('https://api.themoviedb.org/3/discover/movie?&language=en-US&page=1&sort_by=popularity.desc');

      final response = await client.get(
        uri, 
        headers: {
          'Authorization': 'Bearer $accessTokenAuth',
          'accept': 'application/json',
        },
      );
      return List<Movie>.from(json.decode(response.body)['results'].map((movie) => Movie.fromJson(movie)));
    } catch(e) {
      throw Error();
    }
  }

  Future<List<Genre>?> getAllGenre() async {
    try{

      final uri = Uri.parse('https://api.themoviedb.org/3/genre/movie/list');

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
}