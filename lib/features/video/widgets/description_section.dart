import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:red_eyes_app/features/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../untinl/super_function.dart';
import '../../widgets/peertube_linked_text.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({
    super.key,
    required this.title,
    required this.views,
    required this.publishedAt,
    required this.description,
  });

  final String title;
  final int views;
  final DateTime publishedAt;
  final String description;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showBottomSheet(
            backgroundColor: Colors.black.withOpacity(0),
            context: context,
            builder: ((context) => PeertubeBottomSheet(
                title: "Description",
                child: SingleChildScrollView(
                  child: ListTile(
                    title: Text(title),
                    subtitle: PeertubeLinkedText(description),
                  ),
                ))));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$views views - ${SuperFunction.formatDateToString(publishedAt)}",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text("more...", style: Theme.of(context).textTheme.bodyMedium)
            ],
          ),
        ],
      ),
    );
  }
}
