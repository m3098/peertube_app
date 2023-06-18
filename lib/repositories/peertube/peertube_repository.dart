import 'package:dio/dio.dart';

class PeertubeRepository {
  Future<void> getVideoList() async {
    final responce = await Dio().get("https://peertube.su/api/v1/videos");
    final data = responce.data;
  }
}
