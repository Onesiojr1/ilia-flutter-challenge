import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ilia_flutter_challenge/model/genre.dart';
import 'package:ilia_flutter_challenge/model/movie.dart';
import 'package:ilia_flutter_challenge/widgets/molecules/movie_item.dart';

void main() {
  testWidgets('should render movie item', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              MovieItem(
                movie: Movie(
                  genreIds: [1,2], 
                  id: 123, 
                  overview: 'this is a test', 
                  voteAverage: 123, 
                  posterPath: null, 
                  releaseDate: '2020-01-01', 
                  title: 'test',
                ),
                genres: [
                  Genre(id: 1, name: 'test'),
                  Genre(id: 2, name: 'test2'),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.text('test, test2'), findsOneWidget);
    expect(find.text('test'), findsOneWidget);
    expect(find.byKey(const Key('no-image')), findsOneWidget);
  });
}