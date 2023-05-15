import 'package:flutter/material.dart';
import 'package:starlight_clone/util/constant.dart';

class VoteText extends StatelessWidget {
  const VoteText({
    super.key,
    required this.name,
    required this.votes,
  });

  final String name;
  final String votes;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          "${numberFormat.format(int.parse(votes))} Votes",
          style: Theme.of(context).textTheme.displaySmall,
        )
      ],
    );
  }
}
