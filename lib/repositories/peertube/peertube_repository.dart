import 'package:dio/dio.dart';
import 'model/models.dart';
import 'abstract_peertube_repository.dart';

class PeertubeRepository extends AbstractPeertubeRepository {
  final String hostName;
  final String apiVersion;

  PeertubeRepository({required this.hostName, required this.apiVersion});

  @override
  Future<List<PeertubeVideoCardModel>> getVideos({
    String? categoryOneOf,
    int? count,
    bool? excludeAlreadyWatched = false,
    bool? hasHLSFiles = false,
    bool? hasWebtorrentFiles = false,
    bool? isLive = false,
    bool? isLocal = false,
    String? languageOneOf,
    int? licenceOneOf,
    bool? nsfw = false,
    String? sort,
    int? start,
    List<String>? tagsAllOf,
    List<String>? tagsOneOf,
  }) async {
    final response =
        await Dio().get("https://$hostName/api/$apiVersion/videos");
    final data = response.data["data"] as List<dynamic>;

    final videoList = data.map((json) {
      return PeertubeVideoCardModel.fromJson(json);
    }).toList();

    return videoList;
  }
}
