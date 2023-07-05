part of 'video_bloc.dart';

abstract class VideoEvent extends Equatable {
  const VideoEvent();

  @override
  List<Object> get props => [];
}

class LoadVideo extends VideoEvent {
  final int videoId;

  LoadVideo({required this.videoId});
}
