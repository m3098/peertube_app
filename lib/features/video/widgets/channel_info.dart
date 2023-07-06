import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/video_bloc.dart';

class ChannelInfo extends StatelessWidget {
  const ChannelInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoBloc, VideoState>(
      builder: (context, state) {
        if (state is VideoLoaded) {
          return TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: state.peertubeVideoFullModel.channel!.avatars?[0] !=
                            null
                        ? Image.network(
                            "https://peertube.su${state.peertubeVideoFullModel.channel!.avatars![0].path}")
                        : const FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Center(child: Text("no avatar")),
                          ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${state.peertubeVideoFullModel.channel?.name}",
                          style: Theme.of(context).textTheme.bodyLarge?.apply(
                              fontWeightDelta: 400, color: Colors.white)),
                      const SizedBox(height: 10),
                      Text(
                          "${state.peertubeVideoFullModel.channel?.followersCount} subs",
                          style: Theme.of(context).textTheme.bodyLarge)
                    ],
                  )
                ],
              ));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
