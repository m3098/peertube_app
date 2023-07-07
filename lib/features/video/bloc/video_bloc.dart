// ignore: depend_on_referenced_packages
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chewie/chewie.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:video_player/video_player.dart';

import '../../../repositories/peertube/model/peertube_video_full_model.dart';
import '../../../repositories/peertube/peertube_repository.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  late ChewieController chewieController;
  late PeertubeVideoFullModel videoModel;

  VideoBloc() : super(VideoInitial()) {
    on<LoadVideo>(
      (event, emit) async {
        emit(VideoLoading());

        try {
          final peertubeRepo = GetIt.I<PeertubeRepository>();
          videoModel = await peertubeRepo.getVideo(id: event.videoId);
          final playlistUrl = videoModel.streamingPlaylists![0].playlistUrl!;
          final videoPlayerController =
              VideoPlayerController.networkUrl(Uri.parse(playlistUrl));

          await videoPlayerController.initialize();
          await videoPlayerController.pause();

          chewieController = ChewieController(
            autoInitialize: false,
            autoPlay: false,
            videoPlayerController: videoPlayerController,
          );

          emit(VideoLoaded(
              peertubeVideoFullModel: videoModel,
              chewieController: chewieController));
        } catch (e) {
          emit(VideoLoadingFailed(exception: e));
        }
      },
    );
    on<PauseVideo>(
      (event, emit) {
        emit(VideoLoaded(
            peertubeVideoFullModel: videoModel,
            chewieController: chewieController
              ..videoPlayerController
              ..pause()));
      },
    );
  }
}
