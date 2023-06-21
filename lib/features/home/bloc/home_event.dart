part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {}

class LoadVideoList extends HomeEvent {
  final Completer? completer;

  LoadVideoList({this.completer});

  @override
  List<Object?> get props => [completer];
}
