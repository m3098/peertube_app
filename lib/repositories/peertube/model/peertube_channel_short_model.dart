import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'peertube_channel_short_model.g.dart';

@JsonSerializable()
class PeertubeChannelShortModel extends Equatable {
  final int? id;
  final String? displayName;
  final String? name;
  final String? url;
  final String? host;

  final Map<String, dynamic> avatar;

  const PeertubeChannelShortModel(
      {required this.id,
      required this.displayName,
      required this.name,
      required this.url,
      required this.host,
      this.avatar = const {}});

  @override
  List<Object?> get props => [
        id,
        displayName,
        name,
        url,
        host,
        avatar,
      ];

  factory PeertubeChannelShortModel.fromJson(Map<String, dynamic> json) =>
      _$PeertubeChannelShortModelFromJson(json);

  Map<String, dynamic> toJson() => _$PeertubeChannelShortModelToJson(this);
}
