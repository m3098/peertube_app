import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_eyes_app/repositories/peertube/model/peertube_video_card_model.dart';
import 'package:red_eyes_app/repositories/peertube/peertube_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PeertubeRepository peertubeRepository;

  HomeBloc(this.peertubeRepository) : super(HomeInitial()) {
    on<LoadVideoList>((event, emit) async {
      if (state is! HomeLoaded) {
        emit(HomeLoading());
      }
      try {
        final videoList = await peertubeRepository.getVideos();
        emit(HomeLoaded(videoList: videoList));
      } catch (e) {
        print(e.toString());
        print(e);
        emit(HomeLoadingFailed(exception: e));
      } finally {
        event.completer?.complete();
      }
    });
  }
}
