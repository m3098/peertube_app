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
  final List<PeertubeVideoModel> videoList;

  HomeLoaded({required this.videoList});

  @override
  List<Object?> get props => [videoList];
}

class HomeLoadingFailed extends HomeState {
  final Object? exception;

  HomeLoadingFailed({required this.exception});

  @override
  List<Object?> get props => [exception];
}
