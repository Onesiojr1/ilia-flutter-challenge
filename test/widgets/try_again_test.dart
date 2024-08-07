import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ilia_flutter_challenge/widgets/molecules/try_again.dart';

void main() {
  testWidgets('shoul render try again', (WidgetTester tester) async {
    var x = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              TryAgain(
                tryAgain: () => x++,
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.warning), findsOneWidget);
    expect(find.text('Something went wrong!'), findsOneWidget);
    final button = find.text('Try again');
    expect(button, findsOneWidget);

    await tester.tap(button);
    await tester.pump();

    expect(x, 1);
  });
}