import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlight_clone/screens/myfavorite/my_favorite_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Seems there are no artists yet.",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontSize: 15, color: Colors.white.withOpacity(0.6)),
          ),
          const SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => const MyFavoriteScreen());
            },
            child: Text(
              "Set my favorite artist",
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
