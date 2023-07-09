import 'package:flutter/material.dart';

class PeertubeBottomSheet extends StatefulWidget {
  PeertubeBottomSheet({
    super.key,
    this.title,
    required this.child,
  });
  final Widget child;
  String? title;

  @override
  State<PeertubeBottomSheet> createState() => _PeertubeBottomSheetState();
}

class _PeertubeBottomSheetState extends State<PeertubeBottomSheet> {
  bool _isOpasity = false;

  _PeertubeBottomSheetState();
  void _toggleOpacity() {
    _isOpasity = !_isOpasity;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      color: Colors.black.withOpacity(_isOpasity ? 0.7 : 1.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: 40, height: 2, color: Colors.red.withOpacity(0.5)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(widget.title ?? "",
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
              Row(
                children: [
                  Text("opacity", style: Theme.of(context).textTheme.bodyLarge),
                  IconButton(
                      onPressed: () {
                        _toggleOpacity();
                      },
                      icon:
                          Icon(_isOpasity ? Icons.toggle_on : Icons.toggle_off))
                ],
              ),
            ],
          ),
          widget.child
        ],
      ),
    );
  }
}
