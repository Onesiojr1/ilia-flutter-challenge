import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ilia_flutter_challenge/store/movie.store.dart';
import 'package:ilia_flutter_challenge/widgets/molecules/movie_item.dart';

class MovieList extends StatefulWidget {
  final ScrollController scrollController;
  const MovieList({
    super.key, 
    required this.scrollController,
  });

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final _store = MovieStore();

  @override
  void initState() {
    super.initState();
    _getMoviesData();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.scrollController.addListener(loadMoreProducts);
    });
  }

  @override
  void dispose() {
    widget.scrollController.dispose();
    super.dispose();
  }

  Future<void> _getMoviesData() async {
    await _store.getMoviesData();
  }

  void loadMoreProducts() {
    if (widget.scrollController.position.pixels > widget.scrollController.position.maxScrollExtent) return;
    if (_store.isLoading) return;
    print('aqui');

    _store.getMoreMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Column(
          children: [
            _store.isLoading 
              ? const Center(
                child: CircularProgressIndicator(),
                ) 
              : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),  
                shrinkWrap: true,
                itemCount: _store.movies!.length,
                itemBuilder: (BuildContext context, int index) {
                  return MovieItem(
                    movie: _store.movies![index],
                    genres: _store.genres!,
                  );
                },
              ),
          ],
        );
      }
    );
  }
}