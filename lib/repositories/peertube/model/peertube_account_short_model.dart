import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'peertube_account_short_model.g.dart';

@JsonSerializable()
class PeertubeAccountShortModel extends Equatable {
  final int? id;
  final String? displayName;
  final String? name;
  final String? url;
  final String? host;

  final Map<String, dynamic> avatar;

  const PeertubeAccountShortModel(
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
  factory PeertubeAccountShortModel.fromJson(Map<String, dynamic> json) =>
      _$PeertubeAccountShortModelFromJson(json);

  Map<String, dynamic> toJson() => _$PeertubeAccountShortModelToJson(this);
}
