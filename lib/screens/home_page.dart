import 'package:flutter/material.dart';
import 'package:ilia_flutter_challenge/widgets/movie_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF07041f),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),//TODO: verificar como remover padding vertical e usar algum outro valor mais correto
          child: Column(
            children: [
              Text(
                'Ilia Movies',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 32),
              MovieItem(),
              MovieItem(),
              MovieItem(),
              MovieItem(),
              MovieItem(),
            ],
          ),
        ),
      ),
    );
  }
}