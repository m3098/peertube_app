import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_eyes_app/features/appbar/peertube_app_bar.dart';

import '../../widgets/anim_loading_widget.dart';
import '../../widgets/video_card.dart';
import '../bloc/search_bloc.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PeertubeAppBar(),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is VideoListLoading) {
            return const Center(
              child: AnimLoadingWidget(),
            );
          } else if (state is VideoListLoaded) {
            return Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "23123 result on this instance for ",
                        style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(
                        text: "dubstep molitva mp3",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.apply(color: Theme.of(context).primaryColor)),
                  ])),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.videoList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return VideoCard(videoModel: state.videoList[index]);
                    },
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
