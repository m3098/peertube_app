import 'models.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'peertube_video_card_model.g.dart';

@JsonSerializable()
class PeertubeVideoCardModel extends Equatable {
  final int? id;
  final String? uuid;
  final String? shortUUID;
  final String? url;
  final String? name;
  final Map<String, dynamic>? category;
  final Map<String, dynamic>? licence;
  final Map<String, dynamic>? language;
  final Map<String, dynamic>? privacy;
  final bool? nfsw;
  final String? truncatedDescription;
  final String? description;
  final bool? isLocal;
  final int? duration;
  final int? views;
  final int? viewers;
  final int? likes;
  final int? dislikes;
  final String? thumbnailPath;
  final String? previewPath;
  final String? embedPath;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final DateTime? originallyPublishedAt;
  final bool? isLive;
  final PeertubeAccountShortModel? account;
  final PeertubeChannelShortModel? channel;

  const PeertubeVideoCardModel(
      {required this.id,
      required this.uuid,
      required this.shortUUID,
      required this.url,
      required this.name,
      required this.category,
      required this.licence,
      required this.language,
      required this.privacy,
      this.nfsw = false,
      required this.truncatedDescription,
      required this.description,
      this.isLocal = false,
      required this.duration,
      required this.views,
      required this.viewers,
      required this.likes,
      required this.dislikes,
      required this.thumbnailPath,
      required this.previewPath,
      required this.embedPath,
      required this.createdAt,
      required this.updatedAt,
      required this.publishedAt,
      required this.originallyPublishedAt,
      this.isLive = false,
      required this.account,
      required this.channel});

  @override
  List<Object?> get props => [
        id,
        uuid,
        shortUUID,
        url,
        name,
        category,
        licence,
        language,
        privacy,
        nfsw,
        truncatedDescription,
        description,
        isLocal,
        duration,
        views,
        viewers,
        likes,
        dislikes,
        thumbnailPath,
        previewPath,
        embedPath,
        createdAt,
        updatedAt,
        publishedAt,
        originallyPublishedAt,
        isLive,
        account,
        channel
      ];

  factory PeertubeVideoCardModel.fromJson(Map<String, dynamic> json) =>
      _$PeertubeVideoCardModelFromJson(json);

  Map<String, dynamic> toJson() => _$PeertubeVideoCardModelToJson(this);
}
