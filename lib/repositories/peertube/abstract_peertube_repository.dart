import 'model/peertube_video_card_model.dart';

abstract class AbstractPeertubeRepository {
  Future<List<PeertubeVideoCardModel>> getVideos({
    String? categoryOneOf,
    int? count,
    bool? excludeAlreadyWatched,
    bool? hasHLSFiles,
    bool? hasWebtorrentFiles,
    bool? isLive,
    bool? isLocal,
    String? languageOneOf,
    int? licenceOneOf,
    bool? nsfw,
    String? sort,
    int? start,
    List<String>? tagsAllOf,
    List<String>? tagsOneOf,
  });
}
