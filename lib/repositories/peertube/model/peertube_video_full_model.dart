import 'package:equatable/equatable.dart';

class PeertubeVideoFullModel extends Equatable {
  final int id;
  final String uuid;
  final String shortUUID;
  final bool isLive;
  final DateTime createdAt;
  final DateTime publishedAt;
  final DateTime updatedAt;
  final DateTime originallyPublishedAt;
  final _CategoryModel category;
  final _LicenseModel licence;
  final _LanguageModel language;
  final _PrivacyModel privacy;
  final String description;
  final int duration;
  final bool isLocal;
  final String name;
  final String thumbnailPath;
  final String previewPath;
  final String embedPath;
  final int views;
  final int likes;
  final int dislikes;
  final bool nsfw;
  final bool waitTranscoding;
  final _ScheduledUpdateModel scheduledUpdate;
  final bool blacklisted;
  final String blacklistedReason;
  final _AccountModel account;
  final _ChannelModel channelModel;
  final int viewers;
  final String descriptionPath;
  final String support;
  final List<String> tags;
  final bool commentsEnabled;
  final bool downloadEnabled;
  final List<_StreamingPlaylists> streamingPlaylists;

  const PeertubeVideoFullModel(
      {required this.uuid,
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
      required this.channelModel,
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
        channelModel,
        viewers,
        descriptionPath,
        support,
        tags,
        commentsEnabled,
        downloadEnabled,
        streamingPlaylists,
      ];
}

class _BaseFields extends Equatable {
  final dynamic id;
  final String label;

  const _BaseFields({required this.id, required this.label});

  @override
  List<Object?> get props => [id, label];
}

class _CategoryModel extends _BaseFields {
  const _CategoryModel({required super.id, required super.label});
}

class _LicenseModel extends _BaseFields {
  const _LicenseModel({required super.id, required super.label});
}

class _LanguageModel extends _BaseFields {
  const _LanguageModel({required super.id, required super.label});
}

class _PrivacyModel extends _BaseFields {
  const _PrivacyModel({required super.id, required super.label});
}

class _StateModel extends _BaseFields {
  const _StateModel({required super.id, required super.label});
}

class _ScheduledUpdateModel extends Equatable {
  final int privacy;
  final DateTime updateAt;

  const _ScheduledUpdateModel({required this.privacy, required this.updateAt});

  @override
  // TODO: implement props
  List<Object?> get props => [privacy, updateAt];
}

class _AccountModel extends Equatable {
  final int id;
  final String name;
  final String displayName;
  final String url;
  final String host;
  final List<_AvatarModel> avatars;
  final bool hostRedundancyAllowed;
  final int followingCount;
  final int followersCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int userId;
  final String description;

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
  // TODO: implement props
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
}

class _ChannelModel extends Equatable {
  final int id;
  final String name;
  final String displayName;
  final String url;
  final String host;
  final List<_AvatarModel> avatars;
  final bool hostRedundancyAllowed;
  final int followingCount;
  final int followersCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String description;
  final String support;
  final bool isLocal;
  final List<_AvatarModel> banners;
  final _OwnerAccount ownerAccount;

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
  // TODO: implement props
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
}

class _AvatarModel extends Equatable {
  final String path;
  final int width;
  final DateTime createdAt;
  final DateTime updatedAt;

  const _AvatarModel(
      {required this.path,
      required this.width,
      required this.createdAt,
      required this.updatedAt});

  @override
  // TODO: implement props
  List<Object?> get props => [path, width, createdAt, updatedAt];
}

class _OwnerAccount extends Equatable {
  final int id;
  final String uuid;

  const _OwnerAccount({required this.id, required this.uuid});

  @override
  // TODO: implement props
  List<Object?> get props => [id, uuid];
}

class _StreamingPlaylists extends Equatable {
  final int id;
  final int type;
  final String playlistUrl;
  final String segmentsSha256Url;

  const _StreamingPlaylists(
      {required this.id,
      required this.type,
      required this.playlistUrl,
      required this.segmentsSha256Url});

  @override
  List<Object?> get props => [id, type, playlistUrl, segmentsSha256Url];
}
