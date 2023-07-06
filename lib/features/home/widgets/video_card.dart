import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:red_eyes_app/features/video/bloc/video_bloc.dart';
import 'package:red_eyes_app/repositories/peertube/model/peertube_video_full_model.dart';

import 'package:red_eyes_app/router/router.dart';
import 'package:red_eyes_app/untinl/super_function.dart';

import '../../widgets/widgets.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({super.key, required this.videoModel});
  final PeertubeVideoFullModel videoModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          _VideoPreview(
            videoModel: videoModel,
          ),
          const SizedBox(
            height: 12,
          ),
          _VideoInfo(
            videoModel: videoModel,
          ),
          const SizedBox(
            height: 6,
          ),
        ],
      ),
    );
  }
}

class _VideoPreview extends StatelessWidget {
  const _VideoPreview({required this.videoModel});
  final PeertubeVideoFullModel videoModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: GestureDetector(
            onTap: () {
              BlocProvider.of<VideoBloc>(context)
                  .add(LoadVideo(videoId: videoModel.id as int));
              AutoRouter.of(context).push(const VideoRoute());
            },
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return SizedBox(
                  width: constraints.maxWidth,
                  child: PeertubeImage(
                    perviewPath: videoModel.previewPath as String,
                    thumbnailPath: videoModel.thumbnailPath as String,
                  ),
                );
              },
            ),
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.8),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child:
                Text(SuperFunction.convertDuration(videoModel.duration as int)),
          ),
        )
      ],
    );
  }
}

class _VideoInfo extends StatelessWidget {
  const _VideoInfo({required this.videoModel});

  final PeertubeVideoFullModel videoModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: videoModel.channel!.avatars!.isNotEmpty
                ? PeertubeImage(
                    perviewPath: videoModel.channel!.avatars![0].path as String)
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
                  "${videoModel.name} ",
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Text(
                  "${videoModel.channel!.name} - ${videoModel.views}  views - ${SuperFunction.formatDateToString(videoModel.publishedAt as DateTime)}",
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
