import 'package:flutter/material.dart';
import 'package:flutter_image/flutter_image.dart';
import 'package:transparent_image/transparent_image.dart';

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
    return FadeInImage.memoryNetwork(
      placeholder: kTransparentImage,
      width: double.infinity,
      fadeInDuration: const Duration(milliseconds: 200),
      fadeInCurve: Curves.easeIn,
      image: "https://peertube.su$perviewPath",
      fit: BoxFit.contain,
      imageErrorBuilder: (context, error, stackTrace) {
        //запасное изображение
        return Image(
            fit: BoxFit.contain,
            image: NetworkImageWithRetry(thumbnailPath.isNotEmpty
                ? "https://peertube.su$thumbnailPath"
                : "https://peertube.su$perviewPath"),
            errorBuilder:
                (BuildContext context, Object error, StackTrace? stackTrace) {
              //если и запасное изображение так не загрузилось
              return const Center(child: Text("Ошибка загрузки изображения"));
            });
      },
    );
  }
}
