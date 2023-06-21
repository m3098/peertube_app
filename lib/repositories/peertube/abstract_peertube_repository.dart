import 'model/peertube_video_model.dart';

abstract class AbstractPeertubeRepository {
  Future<List<PeertubeVideoModel>> getVideoList();
}
