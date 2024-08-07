import 'package:flutter/material.dart';

class NoImage extends StatelessWidget {
  const NoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 150,
      color: const Color(0xFF82828f),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.cancel,
            color: Colors.white,
            size: 32,
          ),
          Text(
            'No image',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}