// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'peertube_account_short_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeertubeAccountShortModel _$PeertubeAccountShortModelFromJson(
        Map<String, dynamic> json) =>
    PeertubeAccountShortModel(
      id: json['id'] as int?,
      displayName: json['displayName'] as String?,
      name: json['name'] as String?,
      url: json['url'] as String?,
      host: json['host'] as String?,
      avatar: json['avatar'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$PeertubeAccountShortModelToJson(
        PeertubeAccountShortModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'name': instance.name,
      'url': instance.url,
      'host': instance.host,
      'avatar': instance.avatar,
    };
