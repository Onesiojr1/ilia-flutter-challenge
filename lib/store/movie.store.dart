import 'package:ilia_flutter_challenge/model/genre.dart';
import 'package:ilia_flutter_challenge/model/movie.dart';
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

  @action
  Future<void> getMoviesData() async {
    _isLoading = true;
    try {
      final movies = await service.getPopularMovies();
      _movies = [..._movies!, ...movies.movies];
      _genres = await service.getAllGenre();
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
    }
  }

  @action
  Future<void> getMoreMovies() async {
    print(_page);
    final movies = await service.getPopularMovies(page: _page);
    _movies = [..._movies!, ...movies.movies];
    movies.totalPages > _page ? _page++ : _page = movies.totalPages;
    print(_page);

  }
}