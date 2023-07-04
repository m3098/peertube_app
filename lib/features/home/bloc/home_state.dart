part of 'home_bloc.dart';

abstract class HomeState extends Equatable {}

class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoaded extends HomeState {
  final List<PeertubeVideoCardModel> videoList;
  final bool isLoadingMoreVideos;

  HomeLoaded({required this.videoList, required this.isLoadingMoreVideos});

  @override
  List<Object?> get props => [videoList, isLoadingMoreVideos];
}

class HomeLoadingFailed extends HomeState {
  final Object? exception;

  HomeLoadingFailed({required this.exception});

  @override
  List<Object?> get props => [exception];
}
