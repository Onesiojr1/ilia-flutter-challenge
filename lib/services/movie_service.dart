import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ilia_flutter_challenge/model/genre.dart';
import 'package:ilia_flutter_challenge/model/movie.dart';
import 'package:ilia_flutter_challenge/model/movie_videos.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final accessTokenAuth = dotenv.env['ACCESSTOKEN'];

class MovieService {
  final client = http.Client();
  final baseUrl = 'https://api.themoviedb.org/3';

   Future<MovieResponse> getMovies({int page = 1}) async {
    final uri = Uri.parse('$baseUrl/movie/now_playing?language=en-US&page=$page&sort_by=popularity.desc');

    final response = await client.get(
      uri, 
      headers: {
        'Authorization': 'Bearer $accessTokenAuth',
        'accept': 'application/json',
      },
    );

    return MovieResponse.fromJson(json.decode(response.body));
  }

  Future<List<Genre>?> getAllGenre() async {
    final uri = Uri.parse('$baseUrl/genre/movie/list');

    final response = await client.get(
      uri, 
      headers: {
        'Authorization': 'Bearer $accessTokenAuth',
        'accept': 'application/json',
      },
    );

    return List<Genre>.from(json.decode(response.body)['genres'].map((genre) => Genre.fromJson(genre)));
  }

  Future<VideoResponse> getTrailer(int id) async {
    final uri = Uri.parse('$baseUrl/movie/$id/videos');

    final response = await client.get(
      uri, 
      headers: {
        'Authorization': 'Bearer $accessTokenAuth',
        'accept': 'application/json',
      },
    );
    return VideoResponse.fromJson(json.decode(response.body));
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