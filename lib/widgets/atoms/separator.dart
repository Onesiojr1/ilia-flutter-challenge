import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  const Separator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          height: 1,
          color: const Color(0xFF82828f),
        ),
        const SizedBox(height: 16)
      ],
    );
  }
}