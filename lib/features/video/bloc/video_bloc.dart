// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:chewie/chewie.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:video_player/video_player.dart';

import '../../../repositories/peertube/model/peertube_video_full_model.dart';
import '../../../repositories/peertube/peertube_repository.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  ChewieController? chewieController;
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
            materialProgressColors: ChewieProgressColors(
                playedColor: Colors.red,
                bufferedColor: const Color.fromARGB(100, 255, 67, 54),
                backgroundColor: const Color.fromARGB(50, 0, 0, 0)),
            autoInitialize: false,
            autoPlay: false,
            videoPlayerController: videoPlayerController,
          );

          emit(VideoLoaded(
              peertubeVideoFullModel: videoModel,
              chewieController: chewieController!));
        } catch (e) {
          emit(VideoLoadingFailed(exception: e));
        }
      },
    );
    on<DisposeVideoPlayer>(
      (event, emit) {
        if (chewieController != null) {
          chewieController!.dispose();
          chewieController!.videoPlayerController.dispose();
        }
      },
    );

    on<VideoPause>(
      (event, emit) {
        if (chewieController != null) {
          chewieController!.pause();
          chewieController!.videoPlayerController.pause();
        }
      },
    );
  }
}
