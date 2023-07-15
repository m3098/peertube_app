import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_eyes_app/features/appbar/peertube_app_bar.dart';
import 'package:rive/rive.dart';

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
                        text: "result on this instance for ",
                        style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(
                        text: state.searchText,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.apply(color: Theme.of(context).primaryColor)),
                  ])),
                ),
                Expanded(
                  child: RefreshIndicator(
                    color: Theme.of(context).primaryColor,
                    onRefresh: () async {
                      final completer = Completer();
                      BlocProvider.of<SearchBloc>(context).add(SearchVideo(
                          completer: completer, searchText: state.searchText));
                      return completer.future;
                    },
                    child: const SearchList(),
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

class SearchList extends StatelessWidget {
  const SearchList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is VideoListLoaded) {
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.videoList.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == state.videoList.length) {
                  if (state.isSearchListEmpty) {
                    if (state.videoList.isEmpty) {
                      return const Center(
                        child: Text("Not found"),
                      );
                    } else {
                      return const SizedBox();
                    }
                  } else {
                    if (!state.isLoadingMoreVideos) {
                      BlocProvider.of<SearchBloc>(context).add(
                          AddVideoInSearchList(
                              startIndex: state.videoList.length,
                              searchText: state.searchText));
                    }
                    return const Column(
                      children: [
                        SizedBox(
                            height: 30,
                            child: RiveAnimation.asset(
                                "assets/animations/eye.riv"))
                      ],
                    );
                  }
                } else {
                  return VideoCard(videoModel: state.videoList[index]);
                }
              });
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
