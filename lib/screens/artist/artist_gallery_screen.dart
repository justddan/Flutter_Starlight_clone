import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlight_clone/screens/artist/components/community_write.dart';

class ArtistGalleyScreen extends StatelessWidget {
  final String poster;
  final int id;
  const ArtistGalleyScreen({
    super.key,
    required this.poster,
    required this.id,
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
      ),
      body: Column(
        children: [
          Hero(
            tag: id,
            child: Image.asset(
              poster,
              fit: BoxFit.cover,
              width: screenWidth,
              height: screenWidth,
            ),
          ),
          const CommunityWrite(
            avatar: "assets/icon/icon_blackpink.png",
            nickname: "will25pick",
            reply: "12",
            heart: "12",
            text:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1984.\n\n Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1984.",
            date: "11.31.2022",
            hasPicture: true,
          ),
        ],
      ),
    );
  }
}
