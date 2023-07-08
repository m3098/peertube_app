import 'package:flutter/material.dart';

import '../../../untinl/super_function.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
    required this.title,
    required this.views,
    required this.publishedAt,
  });

  final String title;
  final int views;
  final DateTime publishedAt;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
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
