part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchVideo extends SearchEvent {
  final String searchText;
  final Completer? completer;

  const SearchVideo({required this.searchText, this.completer});
  @override
  List<Object> get props => [searchText];
}

class AddVideoInSearchList extends SearchEvent {
  final int startIndex;
  final String searchText;

  const AddVideoInSearchList(
      {required this.startIndex, required this.searchText});
}
