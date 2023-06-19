import 'package:flutter/material.dart';
import 'package:red_eyes_app/features/home/widgets/widgets.dart';
import 'package:red_eyes_app/repositories/peertube/model/peertube_video_model.dart';
import 'package:red_eyes_app/repositories/peertube/peertube_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PeertubeVideoModel> _videoList = [];
  @override
  void initState() {
    super.initState();
    _loadVideoList();
  }

  Future<void> _loadVideoList() async {
    final videoList = await PeertubeRepository().getVideoList();
    setState(() {
      _videoList = videoList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("peertube.su"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.pushNamed(context, "/login");
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: _videoList.isNotEmpty
          ? ListView.builder(
              itemCount: _videoList.length,
              itemBuilder: (BuildContext context, int index) {
                final _videoData = _videoList[index];
                return VideoCard(
                    previewUrl: _videoData.previewUrl,
                    channelAvatarUrl: _videoData.channelAvatarUrl,
                    duration: _videoData.duration,
                    title: _videoData.title,
                    channelName: _videoData.channelName,
                    date: _videoData.date,
                    viewCount: _videoData.viewCount);
              },
            )
          : const CircularProgressIndicator(),
    );
  }
}
