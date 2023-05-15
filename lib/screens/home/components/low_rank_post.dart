import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlight_clone/components/common_poster.dart';
import 'package:starlight_clone/screens/artist/artist_screen.dart';
import 'package:starlight_clone/screens/home/components/vote_text.dart';
import 'package:starlight_clone/util/constant.dart';

class LowRankPoster extends StatelessWidget {
  final String rank, name, votes, poster;
  const LowRankPoster({
    super.key,
    required this.rank,
    required this.name,
    required this.votes,
    required this.poster,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Get.to(() => ArtistScreen(
              rank: rank,
              name: name,
              votes: votes,
              poster: poster,
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
                    rankFormat(rank),
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.5),
                        ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  VoteText(
                    name: name,
                    votes: votes,
                  ),
                ],
              ),
              CommonPoster(
                posterUrl: poster,
                length: screenWidth * 5 / 36,
                radius: 5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
