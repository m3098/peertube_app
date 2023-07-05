import 'package:auto_route/annotations.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../untinl/super_function.dart';
import '../bloc/video_bloc.dart';

@RoutePage()
class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late ChewieController chewieController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    chewieController.videoPlayerController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoBloc, VideoState>(
      builder: (context, state) {
        if (state is VideoLoaded) {
          chewieController = state.chewieController;
          return Scaffold(
            appBar: AppBar(title: Text("TEXT")),
            body: SafeArea(
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Chewie(
                      controller: chewieController,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.peertubeVideoFullModel.name ?? "null",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${state.peertubeVideoFullModel.views} views - ${SuperFunction.formatDateToString(state.peertubeVideoFullModel.publishedAt!)}",
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${state.peertubeVideoFullModel.channel?.name}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.apply(
                                          fontWeightDelta: 400,
                                          color: Colors.white)),
                              SizedBox(height: 10),
                              Text(
                                  "${state.peertubeVideoFullModel.channel?.followersCount} subs",
                                  style: Theme.of(context).textTheme.bodyLarge)
                            ],
                          )
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
                                    Text(
                                        "${state.peertubeVideoFullModel.likes}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge)
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
                                    Text(
                                        "${state.peertubeVideoFullModel.dislikes}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge)
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
                                    style:
                                        Theme.of(context).textTheme.bodyLarge)
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
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
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
        } else if (state is VideoLoadingFailed) {
          print(state.exception.toString());
          return Center(child: Text(state.exception.toString()));
        } else {
          return SizedBox();
        }
      },
    );
  }
}
