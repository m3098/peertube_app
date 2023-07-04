part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {}

class LoadVideoList extends HomeEvent {
  final Completer? completer;

  LoadVideoList({this.completer});

  @override
  List<Object?> get props => [completer];
}

class AddVideoInList extends HomeEvent {
  final int startIndex;

  AddVideoInList({required this.startIndex});
  @override
  List<Object?> get props => [startIndex];
}
