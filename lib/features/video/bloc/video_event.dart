part of 'video_bloc.dart';

abstract class VideoEvent {
  const VideoEvent();
}

class LoadVideo extends VideoEvent {
  final int videoId;

  const LoadVideo({
    required this.videoId,
  });
}

class DisposeVideoPlayer extends VideoEvent {}

class EnterFullScreenVideo extends VideoEvent {}

class ExitFullScreenVideo extends VideoEvent {}
