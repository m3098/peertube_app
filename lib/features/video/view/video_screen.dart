import 'package:auto_route/annotations.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

@RoutePage()    
class VideoScreen extends StatefulWidget {
  VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final String videoUrl =
      "https://videos.redeyes.site/static/streaming-playlists/hls/78aecfd0-4726-4856-b214-346387599e60/2738f075-7eff-4d65-8037-0e09a26757d4-master.m3u8";
  late ChewieController _chewieController;
  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
        videoPlayerController: VideoPlayerController.network(videoUrl));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TEXT")),
      body: SafeArea(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Chewie(
                controller: _chewieController,
              ),
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
