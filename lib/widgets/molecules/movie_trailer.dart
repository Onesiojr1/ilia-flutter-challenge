import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieTrailer extends StatefulWidget {
  final String videoId;

  const MovieTrailer({
    super.key,
    required this.videoId,
  });

  @override
  State<MovieTrailer> createState() => _MovieTrailerState();
}

class _MovieTrailerState extends State<MovieTrailer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      )
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        YoutubePlayer(
          controller: _controller,
        )
      ],
    );
  }
}