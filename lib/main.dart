import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:red_eyes_app/repositories/peertube/peertube_repository.dart';

import 'app.dart';

void main() {
  GetIt.I.registerLazySingleton(
      () => PeertubeRepository(hostName: "peertube.su", apiVersion: "v1"));
  runApp(MyApp());
}
