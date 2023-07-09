import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletons/skeletons.dart';

import '../bloc/video_bloc.dart';
import 'reaction_button.dart';

class SocialSection extends StatelessWidget {
  const SocialSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return BlocBuilder<VideoBloc, VideoState>(
        builder: (context, state) {
          if (state is! VideoLoadingFailed) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Skeleton(
                      isLoading: state is! VideoLoaded,
                      skeleton: const SkeletonLine(
                        style: SkeletonLineStyle(width: 80, height: 30),
                      ),
                      child: state is VideoLoaded
                          ? ReactionButton(
                              text: "${state.peertubeVideoFullModel.likes}",
                              isActive: true,
                              onPressed: () {},
                              iconData: Icons.keyboard_arrow_up)
                          : const SizedBox(),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Skeleton(
                      isLoading: state is! VideoLoaded,
                      skeleton: const SkeletonLine(
                        style: SkeletonLineStyle(width: 80, height: 30),
                      ),
                      child: state is VideoLoaded
                          ? ReactionButton(
                              text: "${state.peertubeVideoFullModel.dislikes}",
                              isActive: false,
                              onPressed: () {},
                              iconData: Icons.keyboard_arrow_down)
                          : const SizedBox(),
                    ),
                  ],
                ),
                ReactionButton(
                    text: "share",
                    isActive: true,
                    onPressed: () {},
                    iconData: Icons.favorite_border)
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      );
    });
  }
}
