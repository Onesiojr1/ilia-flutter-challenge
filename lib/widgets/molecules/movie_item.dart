import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ilia_flutter_challenge/model/genre.dart';
import 'package:ilia_flutter_challenge/model/movie.dart';
import 'package:ilia_flutter_challenge/screens/movie_details_screen.dart';
import 'package:ilia_flutter_challenge/widgets/atoms/no_image.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;
  final List<Genre> genres;
  const MovieItem({
    super.key, 
    required this.movie,
    required this.genres,
  });

  String getGenres() {
    String result = '';

    if(movie.genreIds.isEmpty) return 'No genre';

    genres.where((genre) => movie.genreIds.contains(genre.id)).forEach((genre) {
      result += '${genre.name}, ';
    });

    return result.substring(0, result.length - 2);
  }

  @override
  Widget build(BuildContext context) {
    return  CupertinoButton(
      minSize: 0,
      padding: EdgeInsets.zero,
      onPressed: () => Navigator.of(context)
        .push(MaterialPageRoute(
          builder: (context) => MovieDetailsScreen(movie: movie, genres: genres,),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF24223a),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              movie.posterPath == null
                ? const NoImage()
                : Image.network(
                  'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                  width: 100,
                ),
              const SizedBox(width: 16),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      getGenres(),
                      style: const TextStyle(
                        color: Color(0xFF82828f),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}