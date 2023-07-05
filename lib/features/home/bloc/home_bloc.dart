import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:red_eyes_app/repositories/peertube/model/peertube_video_card_model.dart';
import 'package:red_eyes_app/repositories/peertube/peertube_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final List<PeertubeVideoCardModel> _homePageVideoList = [];
  HomeBloc() : super(HomeInitial()) {
    on<LoadVideoList>((event, emit) async {
      emit(HomeLoading());

      try {
        final videoList = await GetIt.I<PeertubeRepository>().getVideoList();
        _homePageVideoList
          ..clear()
          ..addAll(videoList);

        print("video items: ${_homePageVideoList.length}");
        emit(HomeLoaded(
            videoList: _homePageVideoList, isLoadingMoreVideos: false));
      } catch (e) {
        print(e.toString());
        print(e);
        emit(HomeLoadingFailed(exception: e));
      } finally {
        event.completer?.complete();
      }
    });

    on<AddVideoInList>((event, emit) async {
      print("START  ADD VIDEO IN LIST");
      emit(
          HomeLoaded(videoList: _homePageVideoList, isLoadingMoreVideos: true));
      try {
        final videoList = await GetIt.I<PeertubeRepository>()
            .getVideoList(start: event.startIndex);
        _homePageVideoList.addAll(videoList);

        print("video items: ${_homePageVideoList.length}");
        emit(HomeLoaded(
            videoList: _homePageVideoList, isLoadingMoreVideos: false));
        print("EXIT  ADD VIDEO IN LIST");
      } catch (e) {}
    });
  }
}
