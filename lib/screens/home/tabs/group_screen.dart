import 'package:flutter/material.dart';
import 'package:starlight_clone/models/home/group.dart';
import 'package:starlight_clone/screens/home/components/auction_banner.dart';
import 'package:starlight_clone/screens/home/components/high_rank_poster.dart';
import 'package:starlight_clone/screens/home/components/low_rank_post.dart';

class GroupScreen extends StatelessWidget {
  final String id;
  const GroupScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: SizedBox(
                height: screenWidth * 7 / 18,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return HighRankPoster(
                      rank: (index + 1).toString(),
                      posterUrl: groups[index].imgUrl,
                      name: groups[index].name,
                      votes: groups[index].votes,
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 19,
                  ),
                  itemCount: 3,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Visibility(
              visible: id == "1",
              child: Column(
                children: const [
                  AuctionBanner(),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return LowRankPoster(
                  rank: (index + 4).toString(),
                  name: groups[index + 3].name,
                  votes: groups[index + 3].votes,
                  poster: groups[index + 3].imgUrl,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 15,
              ),
              itemCount: groups.length - 3,
            )
          ],
        ),
      ),
    );
  }
}
