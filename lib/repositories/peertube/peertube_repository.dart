import 'package:dio/dio.dart';
import 'model/models.dart';
import 'abstract_peertube_repository.dart';

class PeertubeRepository extends AbstractPeertubeRepository {
  String hostName;
  String apiVersion;

  PeertubeRepository({required this.hostName, required this.apiVersion});

  @override
  Future<List<PeertubeVideoFullModel>> getVideoList(
      {int categoryOneOf = 100,
      int count = 15,
      bool excludeAlreadyWatched = true,
      bool hasHLSFiles = true,
      bool isLive = false,
      bool isLocal = false,
      bool nsfw = false,
      int start = 0,
      String search = "",
      List<String> tagsOneOf = const []}) async {
    // ignore: prefer_interpolation_to_compose_strings

    String url = "https://$hostName/api/$apiVersion/videos?"
        "search=$search"
        "&count=$count"
        // "&excludeAlreadyWatched=$excludeAlreadyWatched" +
        "&hasHLSFiles=$hasHLSFiles"
        "&isLive=$isLive"
        "&isLocal=$isLocal"
        "&nsfw=$nsfw"
        "&start=$start";
    if (tagsOneOf.isNotEmpty) {
      for (var element in tagsOneOf) {
        url += "&tagsOneOf=$element";
      }
    }

    final response = await Dio().get(url);
    final data = response.data["data"] as List<dynamic>;

    final videoList = data.map((json) {
      return PeertubeVideoFullModel.fromJson(json);
    }).toList();

    return videoList;
  }

  @override
  Future<PeertubeVideoFullModel> getVideo({required int id}) async {
    String url = "https://$hostName/api/$apiVersion/videos/$id";
    final Response<dynamic> response = await Dio().get(url);

    return PeertubeVideoFullModel.fromJson(response.data);
  }
}
