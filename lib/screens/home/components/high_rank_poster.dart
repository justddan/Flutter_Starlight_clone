import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlight_clone/components/common_poster.dart';
import 'package:starlight_clone/screens/artist/artist_screen.dart';
import 'package:starlight_clone/screens/home/components/vote_text.dart';

class HighRankPoster extends StatelessWidget {
  final String rank;
  final String posterUrl;
  final String name;
  final String votes;

  const HighRankPoster({
    super.key,
    required this.rank,
    required this.posterUrl,
    required this.name,
    required this.votes,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Get.to(() => ArtistScreen(
            rank: rank, name: name, votes: votes, poster: posterUrl));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              CommonPoster(
                posterUrl: posterUrl,
                length: screenWidth * 5 / 18,
                radius: 15,
              ),
              Positioned(
                left: -5.0,
                top: screenWidth * 5 / 18 -
                    (rank == "1" ? screenWidth * 5 / 36 : screenWidth / 12),
                child: Stack(
                  children: [
                    Text(
                      rank,
                      style: TextStyle(
                        fontSize: rank == "1"
                            ? screenWidth * 5 / 36
                            : screenWidth / 12,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 1
                          ..color = Colors.white,
                      ),
                    ),
                    Text(
                      rank,
                      style: TextStyle(
                        fontSize: rank == "1"
                            ? screenWidth * 5 / 36
                            : screenWidth / 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          VoteText(name: name, votes: votes)
        ],
      ),
    );
  }
}
