class SharePost {
  final String title, image;
  final int shareId;

  SharePost({
    required this.title,
    required this.image,
    required this.shareId,
  });
}

List<SharePost> shares = [
  SharePost(
    image: "assets/images/img_link.png",
    title: "Link",
    shareId: 0,
  ),
  SharePost(
    image: "assets/images/img_sms.png",
    title: "SMS",
    shareId: 1,
  ),
  SharePost(
    image: "assets/images/img_discord.png",
    title: "Discord",
    shareId: 2,
  ),
  SharePost(
    image: "assets/images/img_pinterest.png",
    title: "Pinterest",
    shareId: 3,
  ),
];
