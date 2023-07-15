import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_eyes_app/features/appbar/peertube_app_bar.dart';

import '../../widgets/anim_loading_widget.dart';

import '../bloc/search_bloc.dart';
import '../widgets/widgets.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PeertubeAppBar(),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is VideoListLoading) {
            return const Center(
              child: AnimLoadingWidget(),
            );
          } else if (state is VideoListLoaded) {
            return Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ResultPanel(
                    searchText: state.searchText,
                  ),
                ),
                Expanded(
                  child: RefreshIndicator(
                    color: Theme.of(context).primaryColor,
                    onRefresh: () async {
                      final completer = Completer();
                      BlocProvider.of<SearchBloc>(context).add(SearchVideo(
                          completer: completer, searchText: state.searchText));
                      return completer.future;
                    },
                    child: const SearchList(),
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
