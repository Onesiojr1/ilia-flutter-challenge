class Movie{
  List<int> genreIds;
  int id;
  String overview;
  double voteAverage;
  String? posterPath;
  String releaseDate;
  String title;

  Movie({
    required this.genreIds,
    required this.id,
    required this.overview,
    required this.voteAverage,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
  });

  Movie.fromJson(Map<String, dynamic> json) 
    : genreIds = json['genre_ids'].cast<int>(),
      id = json['id'],
      overview = json['overview'],
      voteAverage = json['vote_average'],
      posterPath = json['poster_path'],
      releaseDate = json['release_date'],
      title = json['title'];
}


class MovieResponse {
  int page;
  List<Movie> movies;
  int totalPages;
  int totalResults;

  MovieResponse.fromJson(Map<String, dynamic> json)
    : page = json['page'],
      movies = List<Movie>.from(json['results'].map((movie) => Movie.fromJson(movie))),
      totalPages = json['total_pages'],
      totalResults = json['total_results'];
}