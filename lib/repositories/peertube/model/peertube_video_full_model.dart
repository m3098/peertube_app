// ignore_for_file: library_private_types_in_public_api

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'peertube_video_full_model.g.dart';

@JsonSerializable()
class PeertubeVideoFullModel extends Equatable {
  final int? id;
  final String? url;
  final String? uuid;
  final String? shortUUID;
  final bool? isLive;
  final DateTime? createdAt;
  final DateTime? publishedAt;
  final DateTime? updatedAt;
  final DateTime? originallyPublishedAt;
  final _CategoryModel? category;
  final _LicenseModel? licence;
  final _LanguageModel? language;
  final _PrivacyModel? privacy;
  final String? description;
  final int? duration;
  final bool? isLocal;
  final String? name;
  final String? thumbnailPath;
  final String? previewPath;
  final String? embedPath;
  final int? views;
  final int? likes;
  final int? dislikes;
  final bool? nsfw;
  final bool? waitTranscoding;
  final _ScheduledUpdateModel? scheduledUpdate;
  final bool? blacklisted;
  final String? blacklistedReason;
  final _AccountModel? account;
  final _ChannelModel? channel;
  final int? viewers;
  final String? descriptionPath;
  final String? support;
  final List<String>? tags;
  final bool? commentsEnabled;
  final bool? downloadEnabled;
  final List<_StreamingPlaylistModel>? streamingPlaylists;

  const PeertubeVideoFullModel(
      {required this.url,
      required this.uuid,
      required this.shortUUID,
      required this.isLive,
      required this.createdAt,
      required this.publishedAt,
      required this.updatedAt,
      required this.originallyPublishedAt,
      required this.category,
      required this.licence,
      required this.language,
      required this.privacy,
      required this.description,
      required this.duration,
      required this.isLocal,
      required this.name,
      required this.thumbnailPath,
      required this.previewPath,
      required this.embedPath,
      required this.views,
      required this.likes,
      required this.dislikes,
      required this.nsfw,
      required this.waitTranscoding,
      required this.scheduledUpdate,
      required this.blacklisted,
      required this.blacklistedReason,
      required this.account,
      required this.channel,
      required this.viewers,
      required this.descriptionPath,
      required this.support,
      required this.tags,
      required this.commentsEnabled,
      required this.downloadEnabled,
      required this.streamingPlaylists,
      required this.id});

  @override
  List<Object?> get props => [
        id,
        url,
        uuid,
        shortUUID,
        isLive,
        createdAt,
        publishedAt,
        updatedAt,
        originallyPublishedAt,
        category,
        licence,
        language,
        privacy,
        description,
        duration,
        isLocal,
        name,
        thumbnailPath,
        previewPath,
        embedPath,
        views,
        likes,
        dislikes,
        nsfw,
        waitTranscoding,
        scheduledUpdate,
        blacklisted,
        blacklistedReason,
        account,
        channel,
        viewers,
        descriptionPath,
        support,
        tags,
        commentsEnabled,
        downloadEnabled,
        streamingPlaylists,
      ];

  factory PeertubeVideoFullModel.fromJson(Map<String, dynamic> json) =>
      _$PeertubeVideoFullModelFromJson(json);

  Map<String, dynamic> toJson() => _$PeertubeVideoFullModelToJson(this);
}

class _BaseFields extends Equatable {
  final dynamic id;
  final String? label;

  const _BaseFields({required this.id, required this.label});

  @override
  List<Object?> get props => [id, label];
}

@JsonSerializable()
class _CategoryModel extends _BaseFields {
  const _CategoryModel({required super.id, required super.label});
  factory _CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

@JsonSerializable()
class _LicenseModel extends _BaseFields {
  const _LicenseModel({required super.id, required super.label});
  factory _LicenseModel.fromJson(Map<String, dynamic> json) =>
      _$LicenseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LicenseModelToJson(this);
}

@JsonSerializable()
class _LanguageModel extends _BaseFields {
  const _LanguageModel({required super.id, required super.label});
  factory _LanguageModel.fromJson(Map<String, dynamic> json) =>
      _$LanguageModelFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageModelToJson(this);
}

@JsonSerializable()
class _PrivacyModel extends _BaseFields {
  const _PrivacyModel({required super.id, required super.label});
  factory _PrivacyModel.fromJson(Map<String, dynamic> json) =>
      _$PrivacyModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrivacyModelToJson(this);
}

@JsonSerializable()
class _StateModel extends _BaseFields {
  const _StateModel({required super.id, required super.label});
}

@JsonSerializable()
class _ScheduledUpdateModel extends Equatable {
  final int? privacy;
  final DateTime? updateAt;

  const _ScheduledUpdateModel({required this.privacy, required this.updateAt});

  @override
  List<Object?> get props => [privacy, updateAt];
  factory _ScheduledUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduledUpdateModelFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduledUpdateModelToJson(this);
}

@JsonSerializable()
class _AccountModel extends Equatable {
  final int? id;
  final String? name;
  final String? displayName;
  final String? url;
  final String? host;
  final List<_AvatarModel>? avatars;
  final bool? hostRedundancyAllowed;
  final int? followingCount;
  final int? followersCount;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? userId;
  final String? description;

  const _AccountModel(
      {required this.id,
      required this.name,
      required this.displayName,
      required this.url,
      required this.host,
      required this.avatars,
      required this.hostRedundancyAllowed,
      required this.followingCount,
      required this.followersCount,
      required this.createdAt,
      required this.updatedAt,
      required this.userId,
      required this.description});

  @override
  List<Object?> get props => [
        id,
        name,
        displayName,
        url,
        host,
        avatars,
        hostRedundancyAllowed,
        followingCount,
        followersCount,
        createdAt,
        updatedAt,
        userId,
        description,
      ];

  factory _AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountModelToJson(this);
}

@JsonSerializable()
class _ChannelModel extends Equatable {
  final int? id;
  final String? name;
  final String? displayName;
  final String? url;
  final String? host;
  final List<_AvatarModel>? avatars;
  final bool? hostRedundancyAllowed;
  final int? followingCount;
  final int? followersCount;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? description;
  final String? support;
  final bool? isLocal;
  final List<_AvatarModel>? banners;
  final _OwnerAccountModel? ownerAccount;

  const _ChannelModel(
      {required this.id,
      required this.name,
      required this.displayName,
      required this.url,
      required this.host,
      required this.avatars,
      required this.hostRedundancyAllowed,
      required this.followingCount,
      required this.followersCount,
      required this.createdAt,
      required this.updatedAt,
      required this.description,
      required this.support,
      required this.isLocal,
      required this.banners,
      required this.ownerAccount});

  @override
  List<Object?> get props => [
        id,
        name,
        displayName,
        url,
        host,
        avatars,
        hostRedundancyAllowed,
        followingCount,
        followersCount,
        createdAt,
        updatedAt,
        description,
        support,
        isLocal,
        banners,
        ownerAccount,
      ];
  factory _ChannelModel.fromJson(Map<String, dynamic> json) =>
      _$ChannelModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelModelToJson(this);
}

@JsonSerializable()
class _AvatarModel extends Equatable {
  final String? path;
  final int? width;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const _AvatarModel(
      {required this.path,
      required this.width,
      required this.createdAt,
      required this.updatedAt});

  @override
  List<Object?> get props => [path, width, createdAt, updatedAt];

  factory _AvatarModel.fromJson(Map<String, dynamic> json) =>
      _$AvatarModelFromJson(json);

  Map<String, dynamic> toJson() => _$AvatarModelToJson(this);
}

@JsonSerializable()
class _OwnerAccountModel extends Equatable {
  final int? id;
  final String? uuid;

  const _OwnerAccountModel({required this.id, required this.uuid});

  @override
  List<Object?> get props => [id, uuid];

  factory _OwnerAccountModel.fromJson(Map<String, dynamic> json) =>
      _$OwnerAccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerAccountModelToJson(this);
}

@JsonSerializable()
class _StreamingPlaylistModel extends Equatable {
  final int? id;
  final int? type;
  final String? playlistUrl;
  final String? segmentsSha256Url;

  const _StreamingPlaylistModel(
      {required this.id,
      required this.type,
      required this.playlistUrl,
      required this.segmentsSha256Url});

  @override
  List<Object?> get props => [id, type, playlistUrl, segmentsSha256Url];
  factory _StreamingPlaylistModel.fromJson(Map<String, dynamic> json) =>
      _$StreamingPlaylistModelFromJson(json);

  Map<String, dynamic> toJson() => _$StreamingPlaylistModelToJson(this);
}
