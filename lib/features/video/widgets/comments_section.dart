import 'package:flutter/material.dart';

class CommentsSection extends StatelessWidget {
  const CommentsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          showBottomSheet(
              backgroundColor: Colors.black.withOpacity(0.0),
              context: context,
              builder: (context) {
                return VideoComments();
              });
        },
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text("Comments",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.apply(fontWeightDelta: 400, color: Colors.white)),
                const SizedBox(width: 5),
                Text("432", style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            ListTile(
              leading: Container(
                height: 40,
                width: 40,
                color: Colors.red,
              ),
              subtitle: Text(
                  "weqewqeqwewq qwe qwe wq eqw e qwe qw eqw qwe qwe qwe qe weqewqeqwewq qwe qwe wq eqw e qwe qw eqw qwe qwe qwe qe weqewqeqwewq qwe qwe wq eqw e qwe qw eqw qwe qwe qwe qe weqewqeqwewq qwe qwe wq eqw e qwe qw eqw qwe qwe qwe qe weqewqeqwewq qwe qwe wq eqw e qwe qw eqw qwe qwe qwe qe weqewqeqwewq qwe qwe wq eqw e qwe qw eqw qwe qwe qwe qe weqewqeqwewq qwe qwe wq eqw e qwe qw eqw qwe qwe qwe qe "),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ));
  }
}

class VideoComments extends StatefulWidget {
  VideoComments({
    super.key,
  });

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  bool _isOpasity = true;
  void _toggleOpacity() {
    _isOpasity = !_isOpasity;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  Text("Comments",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.apply(fontWeightDelta: 400, color: Colors.white)),
                  const SizedBox(width: 5),
                  Text("432", style: Theme.of(context).textTheme.bodyLarge),
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
          Expanded(
            child: ListView.builder(
              itemCount: 100, //
              itemBuilder: (context, index) => ListTile(
                title: Text("Name account"),
                subtitle: Text(
                    "Одним из наиболее заметных достижений ИИ является его способность обрабатывать и анализировать большие объемы данных в режиме реального времени.Одним из наиболее заметных достижений ИИ является его способность обрабатывать и анализировать большие объемы данных в режиме реального времени.Одним из наиболее заметных достижений ИИ является его способность обрабатывать и анализировать большие объемы данных в режиме реального времени.Одним из наиболее заметных достижений ИИ является его способность обрабатывать и анализировать большие объемы данных в режиме реального времени.Одним из наиболее заметных достижений ИИ является его способность обрабатывать и анализировать большие объемы данных в режиме реального времени.Одним из наиболее заметных достижений ИИ является его способность обрабатывать и анализировать большие объемы данных в режиме реального времени.Одним из наиболее заметных достижений ИИ является его способность обрабатывать и анализировать большие объемы данных в режиме реального времени.Одним из наиболее заметных достижений ИИ является его способность обрабатывать и анализировать большие объемы данных в режиме реального времени.Одним из наиболее заметных достижений ИИ является его способность обрабатывать и анализировать большие объемы данных в режиме реального времени.Одним из наиболее заметных достижений ИИ является его способность обрабатывать и анализировать большие объемы данных в режиме реального времени.Одним из наиболее заметных достижений ИИ является его способность обрабатывать и анализировать большие объемы данных в режиме реального времени.Одним из наиболее заметных достижений ИИ является его способность обрабатывать и анализировать большие объемы данных в режиме реального времени."),
                leading: Container(
                  height: 40,
                  width: 40,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
