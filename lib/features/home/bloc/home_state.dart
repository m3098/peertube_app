part of 'home_bloc.dart';

class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<PeertubeVideoModel> videoList;

  HomeLoaded({required this.videoList});
}

class HomeLoadingFailed extends HomeState {
  final Object? exception;

  HomeLoadingFailed({required this.exception});
}
