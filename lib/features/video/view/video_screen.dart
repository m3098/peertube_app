import 'package:auto_route/annotations.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';
import '../bloc/video_bloc.dart';
import '../../anim_widgets/anim_widgets.dart';

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
    return Scaffold(
      appBar: AppBar(title: const Text("TEXT")),
      body: BlocBuilder<VideoBloc, VideoState>(
        builder: (context, state) {
          if (state is VideoLoading) {
            return const AnimLoadingWidget();
          } else if (state is VideoLoaded) {
            chewieController = state.chewieController;
            return SafeArea(
              child: Column(
                children: [
                  PeertubeVideoPlayer(chewieController: chewieController),
                  const VideoHeader(),
                  const ChannelInfo(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.0),
                    child: VideoSocial(),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: CommentsCard(),
                  )
                ],
              ),
            );
          } else if (state is VideoLoadingFailed) {
            return Center(child: Text(state.exception.toString()));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
