import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../untinl/super_function.dart';
import '../bloc/video_bloc.dart';

class VideoHeader extends StatelessWidget {
  const VideoHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoBloc, VideoState>(
      builder: (context, state) {
        if (state is VideoLoaded) {
          return TextButton(
            onPressed: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${state.peertubeVideoFullModel.name}",
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
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
