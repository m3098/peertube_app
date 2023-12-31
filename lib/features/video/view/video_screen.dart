import 'package:auto_route/annotations.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_eyes_app/features/appbar/peertube_app_bar.dart';

import 'package:red_eyes_app/features/widgets/widgets.dart';
import 'package:red_eyes_app/repositories/peertube/model/models.dart';
import 'package:skeletons/skeletons.dart';
import 'package:wakelock/wakelock.dart';

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
    Wakelock.enable();
    super.initState();
  }

  @override
  void dispose() {
    videoBloc.add(DisposeVideoPlayer());
    Wakelock.disable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    videoBloc = BlocProvider.of<VideoBloc>(context);

    return Scaffold(
      appBar: PeertubeAppBar(),
      body: OrientationBuilder(builder: (context, orientation) {
        return BlocBuilder<VideoBloc, VideoState>(
          builder: (context, state) {
            if (state is! VideoLoadingFailed) {
              if (state is VideoLoaded) {
                chewieController = state.chewieController;
              }

              final previewPath = widget.videoCardModel.previewPath as String;
              final thumbnailPath =
                  widget.videoCardModel.thumbnailPath as String;
              final name = widget.videoCardModel.name as String;
              final views = widget.videoCardModel.views as int;
              final publishedAt = widget.videoCardModel.publishedAt as DateTime;
              final channelAvatarPath =
                  widget.videoCardModel.channel?.avatars?.length != 0
                      ? widget.videoCardModel.channel!.avatars![0].path
                          as String
                      : "";
              final channelName = widget.videoCardModel.channel?.name as String;

              return SafeArea(
                child: Column(
                  children: [
                    if (orientation == Orientation.portrait)
                      state is VideoLoaded
                          ? PeertubeVideoPlayer(
                              chewieController: chewieController)
                          : PeertubeImage(
                              perviewPath: previewPath,
                              thumbnailPath: thumbnailPath),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            if (orientation == Orientation.landscape)
                              state is VideoLoaded
                                  ? PeertubeVideoPlayer(
                                      chewieController: chewieController)
                                  : PeertubeImage(
                                      perviewPath: previewPath,
                                      thumbnailPath: thumbnailPath),
                            DescriptionSection(
                                title: name,
                                description: state is VideoLoaded
                                    ? state.peertubeVideoFullModel
                                            .description ??
                                        ""
                                    : "",
                                views: views,
                                publishedAt: publishedAt),
                            ChannelSection(
                                channelAvatarPath: channelAvatarPath,
                                name: channelName,
                                channelFolowers: state is VideoLoaded
                                    ? state.peertubeVideoFullModel.channel!
                                        .followersCount as int
                                    : -42),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.0),
                              child: state is VideoLoaded
                                  ? SocialSection(
                                      shareLink:
                                          "${state.peertubeVideoFullModel.url}",
                                      supportLink:
                                          "${state.peertubeVideoFullModel.support}",
                                    )
                                  : const SkeletonLine(
                                      style: SkeletonLineStyle(height: 30),
                                    ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(6.0),
                              child: CommentsSection(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(child: Text(state.exception.toString()));
            }
          },
        );
      }),
    );
  }
}
