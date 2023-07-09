import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../repositories/peertube/peertube_repository.dart';
import '../../router/router.dart';

class PeertubeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PeertubeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextButton(
          onPressed: () => AutoRouter.of(context).popUntilRoot(),
          child: Text(GetIt.I<PeertubeRepository>().hostName)),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return SearchDialog();
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

class SearchDialog extends StatefulWidget {
  const SearchDialog({
    super.key,
  });

  @override
  State<SearchDialog> createState() => _SearchDialogState();
}

class _SearchDialogState extends State<SearchDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(0),
      alignment: Alignment.topCenter,
      backgroundColor: Colors.black.withOpacity(0),
      child: Container(
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
        height: AppBar().preferredSize.height,
        child: TextField(
          autofocus: true,
          decoration: const InputDecoration(
            hintText: "Search",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
          onSubmitted: (text) {
            AutoRouter.of(context).popUntilRoot();
          },
        ),
      ),
    );
  }
}
