import 'package:dio/dio.dart';
import 'package:red_eyes_app/repositories/peertube/model/peertube_video_model.dart';

import 'abstract_peertube_repository.dart';

class PeertubeRepository extends AbstractPeertubeRepository {
  @override
  Future<List<PeertubeVideoModel>> getVideoList() async {
    final response = await Dio().get("https://peertube.su/api/v1/videos");
    final data = response.data["data"] as List<dynamic>;

    final videoList = data
        .map((item) => PeertubeVideoModel(
              previewUrl: "https://peertube.su${item["previewPath"]}",
              channelAvatarUrl: item["channel"]["avatar"] != null
                  ? "https://peertube.su${item["channel"]["avatar"]["path"]}"
                  : "",
              title: item["name"],
              channelName: item["account"]["displayName"],
              date: DateTime.parse(item["publishedAt"]),
              duration: item["duration"] as int,
              viewCount: item["views"],
            ))
        .toList();
    return videoList;
  }
}
