// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'peertube_video_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeertubeVideoCardModel _$PeertubeVideoCardModelFromJson(
        Map<String, dynamic> json) =>
    PeertubeVideoCardModel(
      id: json['id'] as int?,
      uuid: json['uuid'] as String?,
      shortUUID: json['shortUUID'] as String?,
      url: json['url'] as String?,
      name: json['name'] as String?,
      category: json['category'] as Map<String, dynamic>?,
      licence: json['licence'] as Map<String, dynamic>?,
      language: json['language'] as Map<String, dynamic>?,
      privacy: json['privacy'] as Map<String, dynamic>?,
      nfsw: json['nfsw'] as bool? ?? false,
      truncatedDescription: json['truncatedDescription'] as String?,
      description: json['description'] as String?,
      isLocal: json['isLocal'] as bool? ?? false,
      duration: json['duration'] as int?,
      views: json['views'] as int?,
      viewers: json['viewers'] as int?,
      likes: json['likes'] as int?,
      dislikes: json['dislikes'] as int?,
      thumbnailPath: json['thumbnailPath'] as String?,
      previewPath: json['previewPath'] as String?,
      embedPath: json['embedPath'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      publishedAt: json['publishedAt'] == null
          ? null
          : DateTime.parse(json['publishedAt'] as String),
      originallyPublishedAt: json['originallyPublishedAt'] == null
          ? null
          : DateTime.parse(json['originallyPublishedAt'] as String),
      isLive: json['isLive'] as bool? ?? false,
      account: json['account'] == null
          ? null
          : PeertubeAccountShortModel.fromJson(
              json['account'] as Map<String, dynamic>),
      channel: json['channel'] == null
          ? null
          : PeertubeChannelShortModel.fromJson(
              json['channel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PeertubeVideoCardModelToJson(
        PeertubeVideoCardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'shortUUID': instance.shortUUID,
      'url': instance.url,
      'name': instance.name,
      'category': instance.category,
      'licence': instance.licence,
      'language': instance.language,
      'privacy': instance.privacy,
      'nfsw': instance.nfsw,
      'truncatedDescription': instance.truncatedDescription,
      'description': instance.description,
      'isLocal': instance.isLocal,
      'duration': instance.duration,
      'views': instance.views,
      'viewers': instance.viewers,
      'likes': instance.likes,
      'dislikes': instance.dislikes,
      'thumbnailPath': instance.thumbnailPath,
      'previewPath': instance.previewPath,
      'embedPath': instance.embedPath,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'publishedAt': instance.publishedAt?.toIso8601String(),
      'originallyPublishedAt':
          instance.originallyPublishedAt?.toIso8601String(),
      'isLive': instance.isLive,
      'account': instance.account,
      'channel': instance.channel,
    };
