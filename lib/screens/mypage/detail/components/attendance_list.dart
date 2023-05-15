import 'package:flutter/material.dart';
import 'package:starlight_clone/util/constant.dart';

class AttendanceList extends StatelessWidget {
  final String date, title, balance;

  const AttendanceList({
    super.key,
    required this.date,
    required this.title,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  date,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.white.withOpacity(0.5)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ],
            ),
            Text(
              "+${numberFormat.format(int.parse(balance))}",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Divider(
          color: Theme.of(context).colorScheme.surface,
        ),
      ],
    );
  }
}
