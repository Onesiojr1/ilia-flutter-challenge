import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ilia_flutter_challenge/model/status_enum.dart';
import 'package:ilia_flutter_challenge/store/movie.store.dart';
import 'package:ilia_flutter_challenge/widgets/molecules/search_input.dart';
import 'package:ilia_flutter_challenge/widgets/molecules/try_again.dart';
import 'package:ilia_flutter_challenge/widgets/organisms/movie_list.dart';

final store = MovieStore();

class HomePage extends StatelessWidget {
  final _scrollController = ScrollController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xFF07041f),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            children: [
              const Text(
                'Ilia Movies',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 8),
              SearchInput(store: store),
              const SizedBox(height: 8),
              Observer(
                builder: (context) {
                  return store.status != StatusEnum.error
                    ? MovieList(
                      scrollController: _scrollController,
                      store: store,
                    )
                    : TryAgain(
                      tryAgain: () => store.getMoviesData(),
                    );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}