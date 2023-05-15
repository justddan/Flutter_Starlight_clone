import 'package:flutter/material.dart';

class CommonPoster extends StatelessWidget {
  const CommonPoster({
    super.key,
    required this.posterUrl,
    required this.length,
    required this.radius,
  });

  final String posterUrl;
  final double length;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image(
        image: AssetImage(posterUrl),
        fit: BoxFit.cover,
        width: length,
        height: length,
      ),
    );
  }
}
