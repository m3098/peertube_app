import 'package:dio/dio.dart';
import 'model/models.dart';
import 'abstract_peertube_repository.dart';

class PeertubeRepository extends AbstractPeertubeRepository {
  String hostName;
  String apiVersion;

  PeertubeRepository({required this.hostName, required this.apiVersion});

  @override
  Future<List<PeertubeVideoCardModel>> getVideoList(
      {int categoryOneOf = 100,
      int count = 15,
      bool excludeAlreadyWatched = true,
      bool hasHLSFiles = true,
      bool isLive = false,
      bool isLocal = false,
      bool nsfw = false,
      int start = 0,
      List<String> tagsOneOf = const []}) async {
    // ignore: prefer_interpolation_to_compose_strings
    String url = "https://$hostName/api/$apiVersion/videos?" +
        "count=$count" +
        // "&excludeAlreadyWatched=$excludeAlreadyWatched" +
        "&hasHLSFiles=$hasHLSFiles" +
        "&isLive=$isLive" +
        "&isLocal=$isLocal" +
        "&nsfw=$nsfw" +
        "&start=$start";
    if (tagsOneOf.isNotEmpty) {
      for (var element in tagsOneOf) {
        url += "&tagsOneOf=$element";
      }
    }
    final response = await Dio().get(url);
    final data = response.data["data"] as List<dynamic>;

    final videoList = data.map((json) {
      return PeertubeVideoCardModel.fromJson(json);
    }).toList();

    return videoList;
  }
}
