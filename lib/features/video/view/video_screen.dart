import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_eyes_app/features/widgets/anim_loading_widget.dart';
import 'package:red_eyes_app/features/widgets/widgets.dart';
import 'package:red_eyes_app/repositories/peertube/model/models.dart';

import '../widgets/widgets.dart';
import '../bloc/video_bloc.dart';

@RoutePage()
class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key, required this.videoCardModel}) : super(key: key);

  final PeertubeVideoFullModel videoCardModel;

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late ChewieController chewieController;
  late VideoBloc videoBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    videoBloc.add(PauseVideo());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    videoBloc = BlocProvider.of<VideoBloc>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("TEXT")),
      body: BlocBuilder<VideoBloc, VideoState>(
        builder: (context, state) {
          if (state is! VideoLoadingFailed) {
            if (state is VideoLoaded) {
              chewieController = state.chewieController;
            }

            final previewPath = widget.videoCardModel.previewPath as String;
            final thumbnailPath = widget.videoCardModel.thumbnailPath as String;
            final name = widget.videoCardModel.name as String;
            final views = widget.videoCardModel.views as int;
            final publishedAt = widget.videoCardModel.publishedAt as DateTime;

            return SafeArea(
              child: Column(
                children: [
                  state is VideoLoaded
                      ? PeertubeVideoPlayer(chewieController: chewieController)
                      : PeertubeImage(
                          perviewPath: previewPath,
                          thumbnailPath: thumbnailPath),
                  Expanded(
                    child: Column(
                      children: [
                        VideoHeader(
                            title: name,
                            views: views,
                            publishedAt: publishedAt),
                        ChannelInfo(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: VideoSocial(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: CommentsCard(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text(state.exception.toString()));
          }
        },
      ),
    );
  }
}
