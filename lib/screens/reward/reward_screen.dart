import 'package:flutter/material.dart';
import 'package:starlight_clone/screens/reward/components/reward_rank.dart';

class RewardScreen extends StatelessWidget {
  const RewardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Reward details",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: const [
            RewardRank(
              poster: "assets/images/img_rep_lesserafim.png",
              rank: "1",
              subText: "Lorem Ipsum prize",
            ),
            SizedBox(
              height: 20,
            ),
            RewardRank(
              poster: "assets/images/img_rep_lesserafim.png",
              rank: "2",
              subText: "Lorem Ipsum prize",
            ),
            SizedBox(
              height: 20,
            ),
            RewardRank(
              poster: "assets/images/img_rep_lesserafim.png",
              rank: "3",
              subText: "Lorem Ipsum prize",
            ),
          ],
        ),
      ),
    );
  }
}
