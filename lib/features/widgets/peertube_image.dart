import 'package:flutter/material.dart';
import 'package:flutter_image/flutter_image.dart';
import 'package:get_it/get_it.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../repositories/peertube/peertube_repository.dart';

class PeertubeImage extends StatelessWidget {
  const PeertubeImage({
    super.key,
    required this.perviewPath,
    this.thumbnailPath = "",
  });

  final String perviewPath;
  final String thumbnailPath;

  @override
  Widget build(BuildContext context) {
    return perviewPath.isNotEmpty
        ? FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            width: double.infinity,
            fadeInDuration: const Duration(milliseconds: 200),
            fadeInCurve: Curves.easeIn,
            image:
                "https://${GetIt.I<PeertubeRepository>().hostName}$perviewPath",
            fit: BoxFit.contain,
            imageErrorBuilder: (context, error, stackTrace) {
              //запасное изображение
              return Image(
                  fit: BoxFit.contain,
                  image: NetworkImageWithRetry(thumbnailPath.isNotEmpty
                      ? "https://${GetIt.I<PeertubeRepository>().hostName}$thumbnailPath"
                      : "https://${GetIt.I<PeertubeRepository>().hostName}$perviewPath"),
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    //если и запасное изображение так не загрузилось
                    return const Center(
                        child: Text("Ошибка загрузки изображения"));
                  });
            },
          )
        : const SizedBox();
  }
}
