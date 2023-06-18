import 'package:flutter/material.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Column(
        children: [
          _VideoPreview(),
          SizedBox(
            height: 12,
          ),
          _VideoInfo(),
          SizedBox(
            height: 6,
          ),
        ],
      ),
    );
  }
}

class _VideoPreview extends StatelessWidget {
  const _VideoPreview();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            color: Colors.grey.withOpacity(0.5),
            child: const Center(
              child: Text('Video Player'),
            ),
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.5),
          child: const Padding(
            padding: EdgeInsets.all(4.0),
            child: Text("13:37"),
          ),
        )
      ],
    );
  }
}

class _VideoInfo extends StatelessWidget {
  const _VideoInfo();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            color: Colors.green,
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title of Video ',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                'Channel Name - views - date',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Expanded(
            child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz_outlined))),
          )
        ],
      ),
    );
  }
}
