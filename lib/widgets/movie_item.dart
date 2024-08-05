import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF24223a),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Image.network(
              'https://img.elo7.com.br/product/zoom/1E3BBC2/big-poster-do-filme-deadpool-tamanho-90x-0-cm-loot-op-010-decoracao-geek.jpg',
              width: 100,
            ),
            const SizedBox(width: 16),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'DeadPool and Wolverine',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  const Text(
                    'Action, adventure',
                    style: TextStyle(
                      color: Color(0xFF82828f),
                      fontSize: 18,
                    ),
                  ),
                  CupertinoButton(
                    minSize: 0,
                    padding: EdgeInsets.zero,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                      decoration: const BoxDecoration(
                        color: Color(0xFFe30c39),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: const Text(
                        'More details',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ), 
                    onPressed: () => print('oi'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}