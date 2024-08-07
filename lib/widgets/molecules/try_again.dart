import 'package:flutter/material.dart';

class TryAgain extends StatelessWidget {
  final Function tryAgain;
  const TryAgain({
    super.key, 
    required this.tryAgain,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Icon(
          Icons.warning, 
          size: 100,
          color: Colors.white,
        ),
        const Text(
          'Something went wrong!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => tryAgain(),
          child: const Text('Try again'),
        ),
      ],
    );
  }
}