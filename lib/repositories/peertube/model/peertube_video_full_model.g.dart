// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'peertube_video_full_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeertubeVideoFullModel _$PeertubeVideoFullModelFromJson(
        Map<String, dynamic> json) =>
    PeertubeVideoFullModel(
      url: json['url'] as String?,
      uuid: json['uuid'] as String?,
      shortUUID: json['shortUUID'] as String?,
      isLive: json['isLive'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      publishedAt: json['publishedAt'] == null
          ? null
          : DateTime.parse(json['publishedAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      originallyPublishedAt: json['originallyPublishedAt'] == null
          ? null
          : DateTime.parse(json['originallyPublishedAt'] as String),
      category: json['category'] == null
          ? null
          : _CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      licence: json['licence'] == null
          ? null
          : _LicenseModel.fromJson(json['licence'] as Map<String, dynamic>),
      language: json['language'] == null
          ? null
          : _LanguageModel.fromJson(json['language'] as Map<String, dynamic>),
      privacy: json['privacy'] == null
          ? null
          : _PrivacyModel.fromJson(json['privacy'] as Map<String, dynamic>),
      description: json['description'] as String?,
      duration: json['duration'] as int?,
      isLocal: json['isLocal'] as bool?,
      name: json['name'] as String?,
      thumbnailPath: json['thumbnailPath'] as String?,
      previewPath: json['previewPath'] as String?,
      embedPath: json['embedPath'] as String?,
      views: json['views'] as int?,
      likes: json['likes'] as int?,
      dislikes: json['dislikes'] as int?,
      nsfw: json['nsfw'] as bool?,
      waitTranscoding: json['waitTranscoding'] as bool?,
      scheduledUpdate: json['scheduledUpdate'] == null
          ? null
          : _ScheduledUpdateModel.fromJson(
              json['scheduledUpdate'] as Map<String, dynamic>),
      blacklisted: json['blacklisted'] as bool?,
      blacklistedReason: json['blacklistedReason'] as String?,
      account: json['account'] == null
          ? null
          : _AccountModel.fromJson(json['account'] as Map<String, dynamic>),
      channel: json['channel'] == null
          ? null
          : _ChannelModel.fromJson(json['channel'] as Map<String, dynamic>),
      viewers: json['viewers'] as int?,
      descriptionPath: json['descriptionPath'] as String?,
      support: json['support'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      commentsEnabled: json['commentsEnabled'] as bool?,
      downloadEnabled: json['downloadEnabled'] as bool?,
      streamingPlaylists: (json['streamingPlaylists'] as List<dynamic>?)
          ?.map((e) =>
              _StreamingPlaylistModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int?,
    );

Map<String, dynamic> _$PeertubeVideoFullModelToJson(
        PeertubeVideoFullModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'uuid': instance.uuid,
      'shortUUID': instance.shortUUID,
      'isLive': instance.isLive,
      'createdAt': instance.createdAt?.toIso8601String(),
      'publishedAt': instance.publishedAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'originallyPublishedAt':
          instance.originallyPublishedAt?.toIso8601String(),
      'category': instance.category,
      'licence': instance.licence,
      'language': instance.language,
      'privacy': instance.privacy,
      'description': instance.description,
      'duration': instance.duration,
      'isLocal': instance.isLocal,
      'name': instance.name,
      'thumbnailPath': instance.thumbnailPath,
      'previewPath': instance.previewPath,
      'embedPath': instance.embedPath,
      'views': instance.views,
      'likes': instance.likes,
      'dislikes': instance.dislikes,
      'nsfw': instance.nsfw,
      'waitTranscoding': instance.waitTranscoding,
      'scheduledUpdate': instance.scheduledUpdate,
      'blacklisted': instance.blacklisted,
      'blacklistedReason': instance.blacklistedReason,
      'account': instance.account,
      'channel': instance.channel,
      'viewers': instance.viewers,
      'descriptionPath': instance.descriptionPath,
      'support': instance.support,
      'tags': instance.tags,
      'commentsEnabled': instance.commentsEnabled,
      'downloadEnabled': instance.downloadEnabled,
      'streamingPlaylists': instance.streamingPlaylists,
    };

_CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    _CategoryModel(
      id: json['id'],
      label: json['label'] as String?,
    );

Map<String, dynamic> _$CategoryModelToJson(_CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
    };

_LicenseModel _$LicenseModelFromJson(Map<String, dynamic> json) =>
    _LicenseModel(
      id: json['id'],
      label: json['label'] as String?,
    );

Map<String, dynamic> _$LicenseModelToJson(_LicenseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
    };

_LanguageModel _$LanguageModelFromJson(Map<String, dynamic> json) =>
    _LanguageModel(
      id: json['id'],
      label: json['label'] as String?,
    );

Map<String, dynamic> _$LanguageModelToJson(_LanguageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
    };

_PrivacyModel _$PrivacyModelFromJson(Map<String, dynamic> json) =>
    _PrivacyModel(
      id: json['id'],
      label: json['label'] as String?,
    );

Map<String, dynamic> _$PrivacyModelToJson(_PrivacyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
    };

_StateModel _$StateModelFromJson(Map<String, dynamic> json) => _StateModel(
      id: json['id'],
      label: json['label'] as String?,
    );

Map<String, dynamic> _$StateModelToJson(_StateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
    };

_ScheduledUpdateModel _$ScheduledUpdateModelFromJson(
        Map<String, dynamic> json) =>
    _ScheduledUpdateModel(
      privacy: json['privacy'] as int?,
      updateAt: json['updateAt'] == null
          ? null
          : DateTime.parse(json['updateAt'] as String),
    );

Map<String, dynamic> _$ScheduledUpdateModelToJson(
        _ScheduledUpdateModel instance) =>
    <String, dynamic>{
      'privacy': instance.privacy,
      'updateAt': instance.updateAt?.toIso8601String(),
    };

_AccountModel _$AccountModelFromJson(Map<String, dynamic> json) =>
    _AccountModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      displayName: json['displayName'] as String?,
      url: json['url'] as String?,
      host: json['host'] as String?,
      avatars: (json['avatars'] as List<dynamic>?)
          ?.map((e) => _AvatarModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      hostRedundancyAllowed: json['hostRedundancyAllowed'] as bool?,
      followingCount: json['followingCount'] as int?,
      followersCount: json['followersCount'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      userId: json['userId'] as int?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$AccountModelToJson(_AccountModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'displayName': instance.displayName,
      'url': instance.url,
      'host': instance.host,
      'avatars': instance.avatars,
      'hostRedundancyAllowed': instance.hostRedundancyAllowed,
      'followingCount': instance.followingCount,
      'followersCount': instance.followersCount,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'userId': instance.userId,
      'description': instance.description,
    };

_ChannelModel _$ChannelModelFromJson(Map<String, dynamic> json) =>
    _ChannelModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      displayName: json['displayName'] as String?,
      url: json['url'] as String?,
      host: json['host'] as String?,
      avatars: (json['avatars'] as List<dynamic>?)
          ?.map((e) => _AvatarModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      hostRedundancyAllowed: json['hostRedundancyAllowed'] as bool?,
      followingCount: json['followingCount'] as int?,
      followersCount: json['followersCount'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      description: json['description'] as String?,
      support: json['support'] as String?,
      isLocal: json['isLocal'] as bool?,
      banners: (json['banners'] as List<dynamic>?)
          ?.map((e) => _AvatarModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      ownerAccount: json['ownerAccount'] == null
          ? null
          : _OwnerAccountModel.fromJson(
              json['ownerAccount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChannelModelToJson(_ChannelModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'displayName': instance.displayName,
      'url': instance.url,
      'host': instance.host,
      'avatars': instance.avatars,
      'hostRedundancyAllowed': instance.hostRedundancyAllowed,
      'followingCount': instance.followingCount,
      'followersCount': instance.followersCount,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'description': instance.description,
      'support': instance.support,
      'isLocal': instance.isLocal,
      'banners': instance.banners,
      'ownerAccount': instance.ownerAccount,
    };

_AvatarModel _$AvatarModelFromJson(Map<String, dynamic> json) => _AvatarModel(
      path: json['path'] as String?,
      width: json['width'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$AvatarModelToJson(_AvatarModel instance) =>
    <String, dynamic>{
      'path': instance.path,
      'width': instance.width,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_OwnerAccountModel _$OwnerAccountModelFromJson(Map<String, dynamic> json) =>
    _OwnerAccountModel(
      id: json['id'] as int?,
      uuid: json['uuid'] as String?,
    );

Map<String, dynamic> _$OwnerAccountModelToJson(_OwnerAccountModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
    };

_StreamingPlaylistModel _$StreamingPlaylistModelFromJson(
        Map<String, dynamic> json) =>
    _StreamingPlaylistModel(
      id: json['id'] as int?,
      type: json['type'] as int?,
      playlistUrl: json['playlistUrl'] as String?,
      segmentsSha256Url: json['segmentsSha256Url'] as String?,
    );

Map<String, dynamic> _$StreamingPlaylistModelToJson(
        _StreamingPlaylistModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'playlistUrl': instance.playlistUrl,
      'segmentsSha256Url': instance.segmentsSha256Url,
    };
