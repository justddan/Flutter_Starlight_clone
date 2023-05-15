import 'package:flutter/material.dart';
import 'package:starlight_clone/components/common_poster.dart';

class SearchPoster extends StatelessWidget {
  final String posterUrl;
  final String name;

  const SearchPoster({
    super.key,
    required this.posterUrl,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CommonPoster(
            posterUrl: posterUrl,
            length: screenWidth * 5 / 18,
            radius: 15,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          name,
          style: Theme.of(context).textTheme.headlineSmall,
        )
      ],
    );
  }
}
