import 'package:flutter/material.dart';
import 'package:ilia_flutter_challenge/widgets/organisms/movie_list.dart';

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
              const SizedBox(height: 32),
              MovieList(
                scrollController: _scrollController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}