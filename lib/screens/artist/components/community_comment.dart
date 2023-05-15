import 'package:flutter/material.dart';

class CommunityComment extends StatefulWidget {
  final String avatar, nickname, content, like, date;
  const CommunityComment({
    super.key,
    required this.avatar,
    required this.nickname,
    required this.content,
    required this.like,
    required this.date,
  });

  @override
  State<CommunityComment> createState() => _CommunityCommentState();
}

class _CommunityCommentState extends State<CommunityComment> {
  bool isLike = false;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
        bottom: 16.5,
        left: 15,
        right: 15,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.avatar),
                    radius: screenWidth * 5 / 144,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.nickname,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  "assets/icon/icon_view_more.png",
                  width: screenWidth * 7 / 180,
                  height: screenWidth * 7 / 180,
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            widget.content,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFFA4A29E),
                ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isLike = !isLike;
                  });
                },
                child: Image.asset(
                  isLike
                      ? "assets/icon/icon_like.png"
                      : "assets/icon/icon_like_border.png",
                  color: Colors.white,
                  width: screenWidth / 18,
                  height: screenWidth / 18,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                widget.like,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                widget.date,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white.withOpacity(0.3),
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
