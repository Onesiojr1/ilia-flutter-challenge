// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieStore on MovieStoreBase, Store {
  late final _$_moviesAtom =
      Atom(name: 'MovieStoreBase._movies', context: context);

  List<Movie>? get movies {
    _$_moviesAtom.reportRead();
    return super._movies;
  }

  @override
  List<Movie>? get _movies => movies;

  @override
  set _movies(List<Movie>? value) {
    _$_moviesAtom.reportWrite(value, super._movies, () {
      super._movies = value;
    });
  }

  late final _$_genresAtom =
      Atom(name: 'MovieStoreBase._genres', context: context);

  List<Genre>? get genres {
    _$_genresAtom.reportRead();
    return super._genres;
  }

  @override
  List<Genre>? get _genres => genres;

  @override
  set _genres(List<Genre>? value) {
    _$_genresAtom.reportWrite(value, super._genres, () {
      super._genres = value;
    });
  }

  late final _$_isLoadingAtom =
      Atom(name: 'MovieStoreBase._isLoading', context: context);

  bool get isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  bool get _isLoading => isLoading;

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$_pageAtom = Atom(name: 'MovieStoreBase._page', context: context);

  int get page {
    _$_pageAtom.reportRead();
    return super._page;
  }

  @override
  int get _page => page;

  @override
  set _page(int value) {
    _$_pageAtom.reportWrite(value, super._page, () {
      super._page = value;
    });
  }

  late final _$_finalTrailerAtom =
      Atom(name: 'MovieStoreBase._finalTrailer', context: context);

  Videos? get finalTrailer {
    _$_finalTrailerAtom.reportRead();
    return super._finalTrailer;
  }

  @override
  Videos? get _finalTrailer => finalTrailer;

  @override
  set _finalTrailer(Videos? value) {
    _$_finalTrailerAtom.reportWrite(value, super._finalTrailer, () {
      super._finalTrailer = value;
    });
  }

  late final _$_isLoadingVideoAtom =
      Atom(name: 'MovieStoreBase._isLoadingVideo', context: context);

  bool get isLoadingVideo {
    _$_isLoadingVideoAtom.reportRead();
    return super._isLoadingVideo;
  }

  @override
  bool get _isLoadingVideo => isLoadingVideo;

  @override
  set _isLoadingVideo(bool value) {
    _$_isLoadingVideoAtom.reportWrite(value, super._isLoadingVideo, () {
      super._isLoadingVideo = value;
    });
  }

  late final _$_searchMoviesAtom =
      Atom(name: 'MovieStoreBase._searchMovies', context: context);

  List<Movie>? get searchMovies {
    _$_searchMoviesAtom.reportRead();
    return super._searchMovies;
  }

  @override
  List<Movie>? get _searchMovies => searchMovies;

  @override
  set _searchMovies(List<Movie>? value) {
    _$_searchMoviesAtom.reportWrite(value, super._searchMovies, () {
      super._searchMovies = value;
    });
  }

  late final _$_statusAtom =
      Atom(name: 'MovieStoreBase._status', context: context);

  StatusEnum? get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  StatusEnum? get _status => status;

  @override
  set _status(StatusEnum? value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$getMoviesDataAsyncAction =
      AsyncAction('MovieStoreBase.getMoviesData', context: context);

  @override
  Future<void> getMoviesData() {
    return _$getMoviesDataAsyncAction.run(() => super.getMoviesData());
  }

  late final _$getMoreMoviesAsyncAction =
      AsyncAction('MovieStoreBase.getMoreMovies', context: context);

  @override
  Future<void> getMoreMovies() {
    return _$getMoreMoviesAsyncAction.run(() => super.getMoreMovies());
  }

  late final _$getMovieTrailerAsyncAction =
      AsyncAction('MovieStoreBase.getMovieTrailer', context: context);

  @override
  Future<void> getMovieTrailer(int id) {
    return _$getMovieTrailerAsyncAction.run(() => super.getMovieTrailer(id));
  }

  late final _$searchMovieAsyncAction =
      AsyncAction('MovieStoreBase.searchMovie', context: context);

  @override
  Future<void> searchMovie(String query) {
    return _$searchMovieAsyncAction.run(() => super.searchMovie(query));
  }

  late final _$MovieStoreBaseActionController =
      ActionController(name: 'MovieStoreBase', context: context);

  @override
  void clearSearch() {
    final _$actionInfo = _$MovieStoreBaseActionController.startAction(
        name: 'MovieStoreBase.clearSearch');
    try {
      return super.clearSearch();
    } finally {
      _$MovieStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
