import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ilia_flutter_challenge/model/genre.dart';
import 'package:ilia_flutter_challenge/model/movie.dart';
import 'package:ilia_flutter_challenge/widgets/atoms/separator.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;
  final List<Genre> genres;

  const MovieDetailsScreen({
    super.key,
    required this.movie,
    required this.genres,
  });

  String getGenres() {
    String result = '';

    genres.where((genre) => movie.genreIds.contains(genre.id)).forEach((genre) {
      result += '${genre.name}, ';
    });

    return result.substring(0, result.length - 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFF07041f),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 345,
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        getGenres(),
                        style: const TextStyle(
                          color: Color(0xFF82828f),
                          fontSize: 16,
                        ),
                      ),
                      const Separator(),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Movie Release Date:',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                movie.releaseDate,
                                style: const TextStyle(
                                  color: Color(0xFF82828f),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Movie Populaity:',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                movie.popularity.toString(),
                                style: const TextStyle(
                                  color: Color(0xFF82828f),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          )

                        ],
                      ),
                      const Separator(),
                      const Text(
                        'Movie Overview:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        movie.overview,
                        style: const TextStyle(
                          color: Color(0xFF82828f),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              left: 16,
              top: 32,
              child: CupertinoButton(
                minSize: 0,
                padding: EdgeInsets.zero,
                onPressed: () => Navigator.of(context).pop(),
                child: const Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}