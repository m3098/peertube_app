import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:red_eyes_app/repositories/peertube/peertube_repository.dart';
import '../../../repositories/peertube/model/models.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final List<PeertubeVideoFullModel> _homePageVideoList = [];
  String _searchText = "";

  HomeBloc() : super(HomeInitial()) {
    on<LoadVideoList>((event, emit) async {
      emit(HomeLoading());

      try {
        final videoList = await GetIt.I<PeertubeRepository>()
            .getVideoList(search: _searchText);
        _homePageVideoList
          ..clear()
          ..addAll(videoList);

        emit(HomeLoaded(
          videoList: _homePageVideoList,
          isLoadingMoreVideos: false,
        ));
      } catch (e) {
        emit(HomeLoadingFailed(exception: e));
      } finally {
        event.completer?.complete();
      }
    });

    on<SetSearchText>((event, emit) async {
      _searchText = event.search;

      add(LoadVideoList());
    });

    on<AddVideoInList>((event, emit) async {
      emit(
          HomeLoaded(videoList: _homePageVideoList, isLoadingMoreVideos: true));
      try {
        final videoList = await GetIt.I<PeertubeRepository>()
            .getVideoList(start: event.startIndex, search: _searchText);
        _homePageVideoList.addAll(videoList);

        emit(HomeLoaded(
            videoList: _homePageVideoList, isLoadingMoreVideos: false));
        // ignore: empty_catches
      } catch (e) {}
    });
  }
}
