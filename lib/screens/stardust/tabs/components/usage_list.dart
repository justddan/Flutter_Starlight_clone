import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlight_clone/components/common_poster.dart';
import 'package:starlight_clone/screens/stardust/history_screen.dart';
import 'package:starlight_clone/util/constant.dart';

class UsageList extends StatelessWidget {
  final String date, poster, title, category, balance;

  const UsageList({
    super.key,
    required this.date,
    required this.poster,
    required this.title,
    required this.category,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Get.to(() => HistoryScreen(
              title: title,
              date: date,
              category: category,
              balence: balance,
            ));
      },
      child: Column(
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
                  CommonPoster(
                    posterUrl: poster,
                    length: screenWidth / 9,
                    radius: 5,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleSmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Text(
                "-${numberFormat.format(int.parse(balance))}",
                style: Theme.of(context).textTheme.titleSmall,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: Theme.of(context).colorScheme.surface,
            height: 1,
            thickness: 1,
          )
        ],
      ),
    );
  }
}
