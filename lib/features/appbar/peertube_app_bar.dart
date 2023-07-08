import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../router/router.dart';

class PeertubeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PeertubeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("peertube.su"),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.account_circle),
          onPressed: () {
            AutoRouter.of(context).push(const LoginRoute());
          },
        ),
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
