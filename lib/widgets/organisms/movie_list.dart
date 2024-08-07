import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ilia_flutter_challenge/store/movie.store.dart';
import 'package:ilia_flutter_challenge/widgets/molecules/movie_item.dart';

class MovieList extends StatefulWidget {
  final ScrollController scrollController;
  final MovieStore store;
  
  const MovieList({
    super.key, 
    required this.scrollController, 
    required this.store,
  });

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {

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
    await widget.store.getMoviesData();
  }

  void loadMoreProducts() {
    if (widget.scrollController.position.pixels != widget.scrollController.position.maxScrollExtent) return;
    if (widget.store.isLoading) return;

    widget.store.getMoreMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Column(
          children: [
            widget.store.isLoading 
              ? const Center(
                child: CircularProgressIndicator(),
                ) 
              : widget.store.searchMovies == null
                ? ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),  
                  shrinkWrap: true,
                  itemCount: widget.store.movies!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MovieItem(
                      movie: widget.store.movies![index],
                      genres: widget.store.genres!,
                    );
                  },
                )
                : ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),  
                  shrinkWrap: true,
                  itemCount: widget.store.searchMovies!.isEmpty ? 1 : widget.store.searchMovies!.length,
                  itemBuilder: (BuildContext context, int index) {
                    if(widget.store.searchMovies!.isEmpty) return const Text('No movie found', style: TextStyle(color: Colors.white, fontSize: 18));
                    return MovieItem(
                      movie: widget.store.searchMovies![index],
                      genres: widget.store.genres!,
                    );
                  },
                ),
          ],
        );
      }
    );
  }
}