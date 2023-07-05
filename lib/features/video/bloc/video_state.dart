part of 'video_bloc.dart';

abstract class VideoState extends Equatable {
  const VideoState();

  @override
  List<Object> get props => [];
}

class VideoInitial extends VideoState {}

class VideoLoading extends VideoState {}

class VideoLoaded extends VideoState {
  final PeertubeVideoFullModel peertubeVideoFullModel;
  final ChewieController chewieController;

  VideoLoaded({
    required this.peertubeVideoFullModel,
    required this.chewieController,
  });

  @override
  List<Object> get props => [peertubeVideoFullModel];
}

class VideoLoadingFailed extends VideoState {
  final Object? exception;

  VideoLoadingFailed({required this.exception});
}
