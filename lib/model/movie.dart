class Movie{
  List<int> genreIds;
  int id;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;

  Movie({
    required this.genreIds,
    required this.id,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
  });

  Movie.fromJson(Map<String, dynamic> json) 
    : genreIds = json['genre_ids'].cast<int>(),
      id = json['id'],
      overview = json['overview'],
      popularity = json['popularity'],
      posterPath = json['poster_path'],
      releaseDate = json['release_date'],
      title = json['title'];
}