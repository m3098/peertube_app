import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/video_bloc.dart';

class VideoSocial extends StatelessWidget {
  const VideoSocial({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoBloc, VideoState>(
      builder: (context, state) {
        if (state is VideoLoaded) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  OutlinedButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          const Icon(
                            Icons.keyboard_arrow_up,
                            color: Colors.red,
                          ),
                          const SizedBox(width: 5),
                          Text("${state.peertubeVideoFullModel.likes}",
                              style: Theme.of(context).textTheme.bodyLarge)
                        ],
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  OutlinedButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 5),
                          Text("${state.peertubeVideoFullModel.dislikes}",
                              style: Theme.of(context).textTheme.bodyLarge)
                        ],
                      )),
                ],
              ),
              OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "Share",
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    ],
                  ))
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
