import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:red_eyes_app/repositories/peertube/peertube_repository.dart';

import 'app.dart';

void main() {
  GetIt.I.registerLazySingleton(() =>
      PeertubeRepository(hostName: "videos.redeyes.site", apiVersion: "v1"));
  Bloc.transformer = sequential();

  runApp(MyApp());
}
