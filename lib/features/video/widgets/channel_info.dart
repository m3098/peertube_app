import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:red_eyes_app/features/widgets/peertube_image.dart';
import 'package:skeletons/skeletons.dart';

import '../bloc/video_bloc.dart';

class ChannelInfo extends StatelessWidget {
  const ChannelInfo({
    super.key,
    required this.channelAvatarPath,
    required this.name,
    required this.channelFolowers,
  });
  final String channelAvatarPath;
  final String name;
  final int channelFolowers;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Row(
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: PeertubeImage(perviewPath: channelAvatarPath),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.apply(fontWeightDelta: 400, color: Colors.white)),
                const SizedBox(height: 10),
                BlocBuilder<VideoBloc, VideoState>(
                  builder: (context, state) {
                    return Skeleton(
                      isLoading: state is! VideoLoaded,
                      skeleton: SkeletonLine(
                          style: SkeletonLineStyle(
                        width: 100,
                      )),
                      child: Text("$channelFolowers subs",
                          style: Theme.of(context).textTheme.bodyLarge),
                    );
                  },
                )
              ],
            )
          ],
        ));
  }
}
