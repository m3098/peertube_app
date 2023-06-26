import 'package:flutter/material.dart';
import 'package:red_eyes_app/repositories/peertube/model/peertube_video_card_model.dart';
import 'package:red_eyes_app/untinl/super_function.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({super.key, required this.cardModell});
  final PeertubeVideoCardModel cardModell;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          _VideoPreview(
            previewPath: cardModell.previewPath as String,
            duration: cardModell.duration as int,
          ),
          const SizedBox(
            height: 12,
          ),
          _VideoInfo(
              channelAvatarPath: cardModell.channel?.avatar["path"] ?? "",
              title: cardModell.name as String,
              channelName: cardModell.channel?.name as String,
              date: cardModell.createdAt as DateTime,
              viewCount: cardModell.views as int),
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
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/videos");
            },
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
            child: channelAvatarPath.isNotEmpty
                ? Image.network(
                    "https://peertube.su$channelAvatarPath",
                  )
                : const FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Center(child: Text("no avatar"))),
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
