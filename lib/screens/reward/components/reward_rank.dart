import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlight_clone/screens/reward/reward_detail_screen.dart';
import 'package:starlight_clone/util/constant.dart';

class RewardRank extends StatelessWidget {
  final String poster, rank, subText;

  const RewardRank({
    super.key,
    required this.poster,
    required this.rank,
    required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Get.to(() => RewardDetailScreen(
                  poster: poster,
                  rank: rank,
                  subText: subText,
                ));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(poster),
                fit: BoxFit.cover,
              ),
            ),
            width: screenWidth - 30,
            height: screenWidth * 5 / 18,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "${rankFormat(rank)} place",
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Theme.of(context).colorScheme.secondary),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          subText,
          style: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
