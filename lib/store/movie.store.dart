import 'dart:math';

import 'package:ilia_flutter_challenge/model/genre.dart';
import 'package:ilia_flutter_challenge/model/movie.dart';
import 'package:ilia_flutter_challenge/model/movie_videos.dart';
import 'package:ilia_flutter_challenge/model/status_enum.dart';
import 'package:ilia_flutter_challenge/services/movie_service.dart';
import 'package:mobx/mobx.dart';
part 'movie.store.g.dart';

class MovieStore = MovieStoreBase with _$MovieStore;

abstract class MovieStoreBase with Store {
  MovieService service = MovieService();

  @readonly
  List<Movie>? _movies = [];

  @readonly
  List<Genre>? _genres = [];

  @readonly
  bool _isLoading = false;

  @readonly
  int _page = 1;

  @readonly
  Videos? _finalTrailer;

  @readonly
  bool _isLoadingVideo = false;

  @readonly
  List<Movie>? _searchMovies;

  @readonly
  StatusEnum? _status;

  @action
  Future<void> getMoviesData() async {
    try{
      _isLoading = true;
      final movies = await service.getMovies();
      _movies = [..._movies!, ...movies.movies];
      _genres = await service.getAllGenre();
      _page++;
      _status = StatusEnum.success;
    } catch (e) {
      _status = StatusEnum.error;
    } finally {
      _isLoading = false;
    }
  }

  @action
  Future<void> getMoreMovies() async {
    final movies = await service.getMovies(page: _page);
    _movies = [..._movies!, ...movies.movies];
    _page = min(_page + 1, movies.totalPages);
  }

  @action
  Future<void> getMovieTrailer(int id) async{
    _isLoadingVideo = true;
    final trailer = await service.getTrailer(id);
    _finalTrailer = trailer.results.where((trailer) => trailer.type == 'Trailer').firstOrNull;
    _isLoadingVideo = false;
  }

  @action
  Future<void> searchMovie(String query) async{
    try{
      _isLoading = true;
      final movieResponse = await service.searchMovie(query);
      _searchMovies = movieResponse.movies;
      _status = StatusEnum.success;
    } catch(e) {
      _status = StatusEnum.error;
    } finally{
      _isLoading = false;
    }
    
  }

  @action
  void clearSearch() {
    _searchMovies = null;
  }
}