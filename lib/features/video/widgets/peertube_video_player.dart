import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

class PeertubeVideoPlayer extends StatelessWidget {
  const PeertubeVideoPlayer({
    super.key,
    required this.chewieController,
  });

  final ChewieController chewieController;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Chewie(
        controller: chewieController,
      ),
    );
  }
}
