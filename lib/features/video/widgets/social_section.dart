import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_eyes_app/features/widgets/peertube_linked_text.dart';
import 'package:red_eyes_app/features/widgets/widgets.dart';
import 'package:rive/rive.dart';

import 'package:skeletons/skeletons.dart';

import '../bloc/video_bloc.dart';
import 'reaction_button.dart';

class SocialSection extends StatelessWidget {
  const SocialSection({
    super.key,
    required this.supportLink,
    required this.shareLink,
  });

  final String supportLink;
  final String shareLink;

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
                Row(
                  children: [
                    ReactionButton(
                        text: "share",
                        isActive: false,
                        onPressed: () {},
                        iconData: Icons.share),
                    ReactionButton(
                        text: "support",
                        isActive: true,
                        onPressed: () {
                          showBottomSheet(
                              backgroundColor: Colors.black.withOpacity(0),
                              context: context,
                              builder: ((context) => PeertubeBottomSheet(
                                    title: "SUPPORT",
                                    child: Expanded(
                                      child: SingleChildScrollView(
                                        physics: BouncingScrollPhysics(),
                                        child: Column(children: [
                                          const SizedBox(
                                            height: 150,
                                            child: RiveAnimation.asset(
                                                "assets/animations/support.riv"),
                                          ),
                                          Text(
                                            "Support Authors!",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor),
                                          ),
                                          const SizedBox(
                                            height: 25,
                                          ),
                                          PeertubeLinkedText(supportLink)
                                        ]),
                                      ),
                                    ),
                                  )));
                        },
                        iconData: Icons.favorite_border)
                  ],
                ),
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
