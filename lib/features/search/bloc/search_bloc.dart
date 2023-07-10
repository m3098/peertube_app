import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

import '../../../repositories/peertube/model/peertube_video_full_model.dart';
import '../../../repositories/peertube/peertube_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final List<PeertubeVideoFullModel> _homePageVideoList = [];
  SearchBloc() : super(SearchInitial()) {
    on<SearchVideo>((event, emit) async {
      emit(VideoListLoading());

      try {
        final videoList = await GetIt.I<PeertubeRepository>()
            .getVideoList(search: event.searchText);
        _homePageVideoList
          ..clear()
          ..addAll(videoList);

        emit(VideoListLoaded(
            videoList: _homePageVideoList,
            isLoadingMoreVideos: false,
            searchText: event.searchText));
      } catch (e) {
        emit(VideoListLoadingFailed(exception: e));
      } finally {
        event.completer?.complete();
      }
    });

    on<AddVideoInSearchList>((event, emit) async {
      emit(VideoListLoaded(
          searchText: event.searchText,
          videoList: _homePageVideoList,
          isLoadingMoreVideos: true));
      try {
        final videoList = await GetIt.I<PeertubeRepository>()
            .getVideoList(search: event.searchText, start: event.startIndex);
        _homePageVideoList.addAll(videoList);

        emit(VideoListLoaded(
            searchText: event.searchText,
            videoList: _homePageVideoList,
            isLoadingMoreVideos: false));
        // ignore: empty_catches
      } catch (e) {}
    });
  }
}
