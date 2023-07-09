import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:red_eyes_app/features/home/bloc/home_bloc.dart';
import 'package:rive/rive.dart';
import '../../appbar/peertube_app_bar.dart';
import '..//widgets/widgets.dart';

import '../../widgets/widgets.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PeertubeAppBar(),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeInitial) {
              BlocProvider.of<HomeBloc>(context).add(LoadVideoList());
            }
            if (state is HomeLoading) {
              return const Center(
                child: AnimLoadingWidget(),
              );
            }
            if (state is HomeLoadingFailed) {
              return ErrorPage(
                errorText: state.exception.toString(),
                callback: () =>
                    BlocProvider.of<HomeBloc>(context).add(LoadVideoList()),
              );
            }
            if (state is HomeLoaded) {
              return RefreshIndicator(
                color: Theme.of(context).primaryColor,
                onRefresh: () async {
                  final completer = Completer();
                  BlocProvider.of<HomeBloc>(context)
                      .add(LoadVideoList(completer: completer));
                  return completer.future;
                },
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.videoList.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == state.videoList.length) {
                      if (!state.isLoadingMoreVideos) {
                        BlocProvider.of<HomeBloc>(context).add(
                            AddVideoInList(startIndex: state.videoList.length));
                      }
                      return const Column(
                        children: [
                          SizedBox(
                              height: 30,
                              child: RiveAnimation.asset(
                                  "assets/animations/eye.riv"))
                        ],
                      );
                    } else {
                      return VideoCard(videoModel: state.videoList[index]);
                    }
                  },
                ),
              );
            }
            return const SizedBox();
          },
        ));
  }
}
