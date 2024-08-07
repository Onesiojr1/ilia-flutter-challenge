import 'package:flutter/material.dart';
import 'package:ilia_flutter_challenge/store/movie.store.dart';

class SearchInput extends StatelessWidget {
  final _textController = TextEditingController();
  final MovieStore store;

  SearchInput({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      onSubmitted: (searchParam) {
        if(searchParam.isEmpty || searchParam == '') {
          store.clearSearch();
        }
        store.searchMovie(searchParam);
      },
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(width: 0.8),
        ),
        hintText: 'Search your favorite movie',
        hintStyle: const TextStyle(
          color: Color(0xFF82828f),
        ),
        prefixIcon: const Icon(
          Icons.search,
          size: 30,
        ),
        suffixIcon: IconButton(
          icon: const Icon(
            Icons.clear, 
            size: 30,
          ),
          onPressed: () {
            _textController.clear();
            store.clearSearch();
          }, 
        )
      ),
    );
  }
}