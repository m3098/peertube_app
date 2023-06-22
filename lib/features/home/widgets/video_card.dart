import 'package:flutter/material.dart';
import 'package:red_eyes_app/untinl/super_function.dart';
import 'package:rive/rive.dart';

class VideoCard extends StatelessWidget {
  const VideoCard(
      {super.key,
      required this.previewPath,
      required this.duration,
      required this.title,
      required this.channelName,
      required this.date,
      required this.viewCount,
      required this.channelAvatarPath});
  final String previewPath;
  final String channelAvatarPath;
  final int duration;
  final String title;
  final String channelName;
  final DateTime date;
  final int viewCount;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          _VideoPreview(
            previewPath: previewPath,
            duration: duration,
          ),
          const SizedBox(
            height: 12,
          ),
          _VideoInfo(
              channelAvatarPath: channelAvatarPath,
              title: title,
              channelName: channelName,
              date: date,
              viewCount: viewCount),
          const SizedBox(
            height: 6,
          ),
        ],
      ),
    );
  }
}

class _VideoPreview extends StatelessWidget {
  const _VideoPreview({required this.previewPath, required this.duration});

  final String previewPath;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SizedBox(
                width: constraints.maxWidth,
                child: Image.network(
                  "https://peertube.su$previewPath",
                  fit: BoxFit.contain,
                ),
              );
            },
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.5),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(SuperFunction.convertDurationToText(duration)),
          ),
        )
      ],
    );
  }
}

class _VideoInfo extends StatelessWidget {
  const _VideoInfo(
      {required this.title,
      required this.channelName,
      required this.date,
      required this.viewCount,
      required this.channelAvatarPath});
  final String channelAvatarPath;
  final String title;
  final String channelName;
  final DateTime date;
  final int viewCount;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: channelAvatarPath != null
                ? Image.network(
                    "https://peertube.su$channelAvatarPath",
                  )
                : const RiveAnimation.asset(
                    "assets/animations/eye.riv",
                    fit: BoxFit.contain,
                  ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Text(
                  "$channelName - $viewCount views - ${date.year}.${date.month.toString().padLeft(2, '0')}.${date.day.toString().padLeft(2, '0')}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz_outlined)))
        ],
      ),
    );
  }
}
