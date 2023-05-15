import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlight_clone/util/constant.dart';

class RewardDetailScreen extends StatelessWidget {
  final String poster, rank, subText;
  const RewardDetailScreen({
    super.key,
    required this.poster,
    required this.rank,
    required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Reward details",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage(poster),
            fit: BoxFit.cover,
            width: screenWidth,
            height: screenWidth * 5 / 9,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${rankFormat(rank)} place",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Theme.of(context).colorScheme.secondary),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  subText,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 20),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\n\n It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: const Color(0xFFA4A29E)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
