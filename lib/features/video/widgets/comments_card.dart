import 'package:flutter/material.dart';

class CommentsCard extends StatelessWidget {
  const CommentsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {},
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
                Text("432", style: Theme.of(context).textTheme.bodyLarge)
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  color: Colors.red,
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Text(
                    "фонк сила - рэп могила! фонк сила - рэп могила! фонк сила - рэп могила! фонк сила - рэп могила! фонк сила - рэп могила! фонк сила - рэп могила! фонк сила - рэп могила! ",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ));
  }
}
