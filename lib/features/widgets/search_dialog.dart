import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_eyes_app/features/search/bloc/search_bloc.dart';
import 'package:red_eyes_app/features/video/bloc/video_bloc.dart';

import 'package:red_eyes_app/router/router.dart';

class SearchDialog extends StatelessWidget {
  const SearchDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(0),
      alignment: Alignment.topCenter,
      backgroundColor: Colors.black.withOpacity(0),
      child: Container(
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
        height: AppBar().preferredSize.height,
        child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            return TextField(
              autofocus: true,
              decoration: InputDecoration(
                hintText:
                    state is VideoListLoaded ? state.searchText : "Search",
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              onSubmitted: (text) {
                BlocProvider.of<VideoBloc>(context).add(VideoPause());
                BlocProvider.of<SearchBloc>(context)
                    .add(SearchVideo(searchText: text));
                Navigator.pop(context);

                AutoRouter.of(context).navigate(const SearchRoute());
              },
            );
          },
        ),
      ),
    );
  }
}
