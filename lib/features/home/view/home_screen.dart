import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_eyes_app/features/home/bloc/home_bloc.dart';
import 'package:rive/rive.dart';
import '..//widgets/widgets.dart';

import '../../anim_widgets/anim_widgets.dart';
import 'package:red_eyes_app/repositories/peertube/peertube_repository.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _blocHomeScreen = HomeBloc(PeertubeRepository());

  @override
  void initState() {
    super.initState();
    _blocHomeScreen.add(LoadVideoList());
  }

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
                Navigator.pushNamed(context, "/login");
              },
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          bloc: _blocHomeScreen,
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(
                child: AnimLoadingWidget(),
              );
            }
            if (state is HomeLoadingFailed) {
              return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                          height: 250,
                          child: RiveAnimation.asset(
                              "assets/animations/doomer.riv")),
                      const Text(
                          "Oops! Something is wrong with the network :("),
                      const SizedBox(height: 25),
                      TextButton(
                        onPressed: () {
                          _blocHomeScreen.add(LoadVideoList());
                        },
                        style: TextButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 24),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                            side: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        child: Text('RE-TRY!',
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor)),
                      )
                    ]),
              );
            }
            if (state is HomeLoaded) {
              return RefreshIndicator(
                onRefresh: () async {
                  _blocHomeScreen.add(LoadVideoList());
                },
                child: ListView.builder(
                  itemCount: state.videoList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final videoData = state.videoList[index];
                    return VideoCard(
                        previewUrl: videoData.previewUrl,
                        channelAvatarUrl: videoData.channelAvatarUrl,
                        duration: videoData.duration,
                        title: videoData.title,
                        channelName: videoData.channelName,
                        date: videoData.date,
                        viewCount: videoData.viewCount);
                  },
                ),
              );
            }
            return SizedBox();
          },
        ));
  }
}
