part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class VideoListLoading extends SearchState {}

class VideoListLoaded extends SearchState {
  final String searchText;
  final List<PeertubeVideoFullModel> videoList;
  final bool isLoadingMoreVideos;
  final bool isSearchListEmpty;

  const VideoListLoaded(
      {required this.searchText,
      required this.videoList,
      required this.isLoadingMoreVideos,
      required this.isSearchListEmpty});
  @override
  List<Object> get props =>
      [searchText, videoList, isLoadingMoreVideos, isSearchListEmpty];
}

class VideoListLoadingFailed extends SearchState {
  final Object? exception;

  const VideoListLoadingFailed({this.exception});
  @override
  List<Object> get props => [];
}
