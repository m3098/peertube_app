import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class VideoScreen extends StatefulWidget {
  VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController videoPlayerController720,
      videoPlayerController1080;
  late CustomVideoPlayerController customVideoPlayerController;

  final CustomVideoPlayerSettings customVideoPlayerSettings =
      const CustomVideoPlayerSettings();

  @override
  void initState() {
    super.initState();
    videoPlayerController720 = VideoPlayerController.network(video720)
      ..initialize().then((value) => setState(() {}));
    videoPlayerController1080 = VideoPlayerController.network(video1080);

    customVideoPlayerController = CustomVideoPlayerController(
        context: context,
        videoPlayerController: videoPlayerController720,
        customVideoPlayerSettings: customVideoPlayerSettings,
        additionalVideoSources: {
          "720": videoPlayerController720,
          "1080": videoPlayerController1080
        });
  }

  @override
  void dispose() {
    customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TEXT")),
      body: SafeArea(
        child: Column(
          children: [
            CustomVideoPlayer(
              customVideoPlayerController: customVideoPlayerController,
            ),
            TextButton(
              onPressed: () {},
              child: Column(
                children: [
                  Text(
                    "Нереальный фонк зэиксце для агрессив вайба бесплатно и без смс",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "30 223 views - 2022.03.02",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text("more...",
                          style: Theme.of(context).textTheme.bodyMedium)
                    ],
                  ),
                ],
              ),
            ),
            TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("lixitini",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.apply(fontWeightDelta: 400, color: Colors.white)),
                    SizedBox(width: 10),
                    Text("432 subs",
                        style: Theme.of(context).textTheme.bodyLarge)
                  ],
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      OutlinedButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(
                                Icons.keyboard_arrow_up,
                                color: Colors.red,
                              ),
                              SizedBox(width: 5),
                              Text("180",
                                  style: Theme.of(context).textTheme.bodyLarge)
                            ],
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      OutlinedButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5),
                              Text("180",
                                  style: Theme.of(context).textTheme.bodyLarge)
                            ],
                          )),
                    ],
                  ),
                  OutlinedButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Share",
                            style: Theme.of(context).textTheme.bodyLarge,
                          )
                        ],
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: OutlinedButton(
                  onPressed: () {},
                  child: Column(
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Text("Comments",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.apply(
                                      fontWeightDelta: 400,
                                      color: Colors.white)),
                          SizedBox(width: 5),
                          Text("432",
                              style: Theme.of(context).textTheme.bodyLarge)
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Text(
                              "фонк сила - рэп могила! фонк сила - рэп могила! фонк сила - рэп могила! фонк сила - рэп могила! фонк сила - рэп могила! фонк сила - рэп могила! фонк сила - рэп могила! ",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

String videoUrl =
    'https://peertube.su/static/streaming-playlists/hls/57135a41-5088-4ed6-b636-c567b651f82f/57135a41-5088-4ed6-b636-c567b651f82f-720-fragmented.mp4';
String longVideo =
    'https://peertube.su/static/streaming-playlists/hls/57135a41-5088-4ed6-b636-c567b651f82f/57135a41-5088-4ed6-b636-c567b651f82f-720-fragmented.mp4';

String video720 =
    "https://peertube.su/static/streaming-playlists/hls/57135a41-5088-4ed6-b636-c567b651f82f/57135a41-5088-4ed6-b636-c567b651f82f-720-fragmented.mp4";
String video1080 =
    "https://peertube.su/static/streaming-playlists/hls/57135a41-5088-4ed6-b636-c567b651f82f/57135a41-5088-4ed6-b636-c567b651f82f-1080-fragmented.mp4";
