import 'model/peertube_video_card_model.dart';

abstract class AbstractPeertubeRepository {
  Future<List<PeertubeVideoCardModel>> getVideos({
    int categoryOneOf = 100,
    int count = 15,
    bool excludeAlreadyWatched = true,
    bool hasHLSFiles = true,
    bool isLive = false,
    bool isLocal = true,
    bool nsfw = false,
    int start = 0,
  });
}
