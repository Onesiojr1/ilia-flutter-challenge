import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ilia_flutter_challenge/model/genre.dart';
import 'package:ilia_flutter_challenge/model/movie.dart';
import 'package:ilia_flutter_challenge/store/movie.store.dart';
import 'package:ilia_flutter_challenge/widgets/atoms/custom_back_button.dart';
import 'package:ilia_flutter_challenge/widgets/atoms/separator.dart';
import 'package:ilia_flutter_challenge/widgets/molecules/movie_trailer.dart';

class MovieDetailsScreen extends StatefulWidget {
  final Movie movie;
  final List<Genre> genres;

  const MovieDetailsScreen({
    super.key,
    required this.movie,
    required this.genres,
  });

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final _store = MovieStore();

  @override
  void initState() {
    super.initState();
    _getMovietrailer();
  }

  Future<void> _getMovietrailer() async {
    await _store.getMovieTrailer(widget.movie.id);
  }

  String getGenres() {
    String result = '';
    if(widget.movie.genreIds.isEmpty) return 'No genre';

    widget.genres.where((genre) => widget.movie.genreIds!.contains(genre.id)).forEach((genre) {
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
            Observer(
              builder: (context) {
                return Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 345,
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500${widget.movie.posterPath}',
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
                            widget.movie.title,
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
                                    widget.movie.releaseDate,
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
                                    widget.movie.popularity.toString(),
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
                            widget.movie.overview,
                            style: const TextStyle(
                              color: Color(0xFF82828f),
                              fontSize: 16,
                            ),
                          ),
                          const Separator(),
                          const Text(
                            'Movie Trailer:',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          _store.finalTrailer == null && !_store.isLoadingVideo
                            ? const Text(
                                'No movie trailer available',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              )
                            : _store.isLoadingVideo
                              ? const Center(
                                child: CircularProgressIndicator(),
                              )
                              : MovieTrailer(
                                videoId: _store.finalTrailer?.key  ?? '',
                              ),
                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ],
                );
              }
            ),
            const Positioned(
              left: 16,
              top: 32,
              child: CustomBackButton()
            ),
          ],
        ),
      ),
    );
  }
}