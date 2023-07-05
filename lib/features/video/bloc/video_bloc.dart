import 'package:bloc/bloc.dart';
import 'package:chewie/chewie.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:video_player/video_player.dart';

import '../../../repositories/peertube/model/peertube_video_full_model.dart';
import '../../../repositories/peertube/peertube_repository.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  VideoBloc() : super(VideoInitial()) {
    on<LoadVideo>((event, emit) async {
      emit(VideoLoading());

      try {
        final video =
            await GetIt.I<PeertubeRepository>().getVideo(id: event.videoId);
        final videoPlayerController = VideoPlayerController.networkUrl(
            Uri.parse(video.streamingPlaylists![0].playlistUrl!));
        await videoPlayerController.initialize();

        final chewieController = ChewieController(
          autoInitialize: false,
          videoPlayerController: videoPlayerController,
        );

        emit(VideoLoaded(
            peertubeVideoFullModel: video, chewieController: chewieController));
      } catch (e) {
        emit(VideoLoadingFailed(exception: e));
      }
    });
  }
}
