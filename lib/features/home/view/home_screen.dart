import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:red_eyes_app/features/home/bloc/home_bloc.dart';
import 'package:red_eyes_app/repositories/peertube/model/models.dart';
import 'package:red_eyes_app/router/router.dart';
import 'package:rive/rive.dart';
import '..//widgets/widgets.dart';

import '../../anim_widgets/anim_widgets.dart';
import 'package:red_eyes_app/repositories/peertube/peertube_repository.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("peertube.su"),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: () {
                AutoRouter.of(context).push(LoginRoute());
              },
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
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
                  itemCount: state.videoList.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == state.videoList.length) {
                      if (!state.isLoadingMoreVideos) {
                        BlocProvider.of<HomeBloc>(context).add(
                            AddVideoInList(startIndex: state.videoList.length));
                      }
                      return Column(
                        children: [
                          SizedBox(
                              height: 30,
                              child: RiveAnimation.asset(
                                  "assets/animations/eye.riv"))
                        ],
                      );
                    } else {
                      return VideoCard(cardModell: state.videoList[index]);
                    }
                  },
                ),
              );
            }
            return SizedBox();
          },
        ));
  }
}