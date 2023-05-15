import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlight_clone/components/common_short_radius_button.dart';
import 'package:starlight_clone/models/community/comment.dart';
import 'package:starlight_clone/screens/artist/components/community_comment.dart';

class CommentScreen extends StatefulWidget {
  final String comment;
  const CommentScreen({
    super.key,
    required this.comment,
  });

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  bool isMostLike = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: GestureDetector(
              onTap: () => Get.back(),
              child: const Icon(
                Icons.close_rounded,
                color: Colors.white,
              ),
            ),
          )
        ],
        title: Text(
          "${widget.comment} comments",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonShortRadiusButton(
                      paddingVertical: 10,
                      paddingHorizontal: 15,
                      title: Text(
                        "Most recent",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                                color:
                                    isMostLike ? Colors.white : Colors.black),
                      ),
                      backgroundColor: isMostLike ? Colors.black : Colors.white,
                      borderColor: Colors.white,
                      prefixIcon: "assets/icon/icon_recent.png",
                      prefixColor: isMostLike ? Colors.white : Colors.black,
                      prefixWidth: screenWidth / 24,
                      fun: () {
                        setState(() {
                          isMostLike = false;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    CommonShortRadiusButton(
                      paddingVertical: 10,
                      paddingHorizontal: 15,
                      title: Text(
                        "Most likes",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                                color:
                                    isMostLike ? Colors.black : Colors.white),
                      ),
                      backgroundColor: isMostLike ? Colors.white : Colors.black,
                      borderColor: Colors.white,
                      prefixIcon: "assets/icon/icon_like_border.png",
                      prefixColor: isMostLike ? Colors.black : Colors.white,
                      prefixWidth: screenWidth / 24,
                      fun: () {
                        setState(() {
                          isMostLike = true;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Colors.white.withOpacity(0.3),
                  thickness: 1,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CommunityComment(
                      avatar: comments[index].avatar,
                      nickname: comments[index].nickname,
                      content: comments[index].content,
                      like: comments[index].like,
                      date: comments[index].date,
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.white.withOpacity(0.1),
                    thickness: 1,
                  ),
                  itemCount: comments.length,
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: screenWidth,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              color: Theme.of(context).colorScheme.onBackground,
              child: TextField(
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  hintText: "Add a comment",
                  hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
