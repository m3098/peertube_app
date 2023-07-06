import 'package:red_eyes_app/repositories/peertube/model/models.dart';

abstract class AbstractPeertubeRepository {
  Future<List<PeertubeVideoFullModel>> getVideoList({
    int categoryOneOf = 100,
    int count = 15,
    bool excludeAlreadyWatched = true,
    bool hasHLSFiles = true,
    bool isLive = false,
    bool isLocal = true,
    bool nsfw = false,
    int start = 0,
  });

  Future<PeertubeVideoFullModel> getVideo({
    required int id,
  });
}
