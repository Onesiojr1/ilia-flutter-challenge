import 'package:flutter/material.dart';
import 'package:ilia_flutter_challenge/model/movie.dart';
import 'package:ilia_flutter_challenge/widgets/movie_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xFF07041f),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),//TODO: verificar como remover padding vertical e usar algum outro valor mais correto
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
              MovieItem(
                movie: Movie(
                  genreIds: [1,2,3], 
                  id: 533535, 
                  overview: "Um apático Wade Wilson trabalha duro na vida civil. Seus dias como mercenário moralmente flexível, Deadpool, ficou para trás. Quando seu planeta enfrenta uma ameaça, Wade deve relutantemente vestir-se novamente com um ainda mais relutante... relutante? Mais relutante? Ele deve convencer um Wolverine relutante em... Porra. As sinopses são tão estúpidas.", 
                  popularity: 23022.328, 
                  posterPath: "/qkhZRqCWqJ376sBzD4MeAO2w4wv.jpg", 
                  releaseDate: "2024-07-24",
                  title: "Deadpool & Wolverine",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}