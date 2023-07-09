import 'package:flutter/material.dart';
import '../../widgets/peertube_bottom_sheet.dart';
import 'widgets.dart';

class CommentsSection extends StatelessWidget {
  const CommentsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          showBottomSheet(
              backgroundColor: Colors.black.withOpacity(0.0),
              context: context,
              builder: (context) {
                return PeertubeBottomSheet(
                  title: "Comments 100",
                  child: const CommetnsList(),
                );
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
              subtitle: const Text(
                  "weqewqeqwewq qwe qwe wq eqw e qwe qw eqw qwe qwe qwe qe weqewqeqwewq qwe qwe wq eqw e qwe qw eqw qwe qwe qwe qe weqewqeqwewq qwe qwe wq eqw e qwe qw eqw qwe qwe qwe qe weqewqeqwewq qwe qwe wq eqw e qwe qw eqw qwe qwe qwe qe weqewqeqwewq qwe qwe wq eqw e qwe qw eqw qwe qwe qwe qe weqewqeqwewq qwe qwe wq eqw e qwe qw eqw qwe qwe qwe qe weqewqeqwewq qwe qwe wq eqw e qwe qw eqw qwe qwe qwe qe "),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ));
  }
}
