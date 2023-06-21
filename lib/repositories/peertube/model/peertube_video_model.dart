import 'package:equatable/equatable.dart';

class PeertubeVideoModel extends Equatable {
  PeertubeVideoModel(
      {required this.previewUrl,
      required this.channelAvatarUrl,
      required this.title,
      required this.channelName,
      required this.date,
      required this.duration,
      required this.viewCount});

  final String previewUrl;
  final String channelAvatarUrl;
  final String title;
  final String channelName;
  final DateTime date;
  final int duration;
  final int viewCount;

  @override
  List<Object?> get props => [
        previewUrl,
        channelAvatarUrl,
        title,
        channelName,
        channelName,
        date,
        duration,
        viewCount
      ];
}
