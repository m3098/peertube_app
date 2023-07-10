import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

import '../../repositories/peertube/peertube_repository.dart';
import '../../router/router.dart';
import '../widgets/search_dialog.dart';

class PeertubeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PeertubeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextButton(
          onPressed: () {
            AutoRouter.of(context).popUntilRoot();
          },
          child: Text(GetIt.I<PeertubeRepository>().hostName)),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return const SearchDialog();
                });
          },
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
