import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlight_clone/components/common_short_radius_button.dart';
import 'package:starlight_clone/components/common_text_with_close_header_bottom_sheet.dart';
import 'package:starlight_clone/models/community/share.dart';
import 'package:starlight_clone/screens/artist/comment_screen.dart';
import 'package:starlight_clone/screens/artist/components/report_dialog.dart';
import 'package:starlight_clone/util/constant.dart';

class CommunityWrite extends StatefulWidget {
  final String avatar, nickname, reply, heart, text, date;
  final bool hasPicture;
  final String? picture;

  const CommunityWrite({
    super.key,
    required this.avatar,
    required this.nickname,
    required this.reply,
    required this.heart,
    required this.text,
    required this.date,
    required this.hasPicture,
    this.picture,
  });

  @override
  State<CommunityWrite> createState() => _CommunityWriteState();
}

class _CommunityWriteState extends State<CommunityWrite> {
  bool isAll = false;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Visibility(
          visible: widget.picture != null,
          child: Image.asset(
            widget.picture ?? "",
            width: screenWidth,
            height: screenWidth * 5 / 9,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: screenWidth * 5 / 144,
                        backgroundImage: AssetImage(widget.avatar),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.nickname,
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => CommentScreen(comment: widget.reply));
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/icon/icon_reply.png",
                              width: screenWidth / 18,
                              height: screenWidth / 18,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              numberFormat.format(int.parse(widget.reply)),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        "assets/icon/icon_heart_border.png",
                        width: screenWidth / 18,
                        height: screenWidth / 18,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        numberFormat.format(int.parse(widget.heart)),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 15),
                      ),
                    ],
                  )
                ],
              ),
              Visibility(
                visible: widget.text.isNotEmpty,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      widget.text,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: const Color(0xFFA4A29E),
                          ),
                      overflow:
                          isAll ? TextOverflow.visible : TextOverflow.ellipsis,
                      maxLines: isAll ? null : 3,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Visibility(
                      visible: isAll == false,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isAll = true;
                          });
                        },
                        child: Text(
                          "Show more",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(decoration: TextDecoration.underline),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.date,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.white.withOpacity(0.5)),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Visibility(
                    visible: widget.hasPicture,
                    child: Flexible(
                      child: CommonShortRadiusButton(
                        paddingVertical: 10,
                        paddingHorizontal: 20,
                        prefixIcon: "assets/icon/icon_save.png",
                        prefixColor: Colors.white,
                        prefixWidth: screenWidth / 18,
                        title: Text(
                          "Save",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontSize: 15),
                        ),
                        backgroundColor:
                            Theme.of(context).colorScheme.onBackground,
                        borderColor: Colors.transparent,
                        fun: () {
                          _showSaveBottomSheet();
                        },
                      ),
                    ),
                  ),
                  Visibility(
                    visible: widget.hasPicture,
                    child: const SizedBox(
                      width: 10,
                    ),
                  ),
                  Flexible(
                    child: CommonShortRadiusButton(
                      paddingVertical: 10,
                      paddingHorizontal: 20,
                      prefixIcon: "assets/icon/icon_share.png",
                      prefixColor: Colors.white,
                      prefixWidth: screenWidth / 18,
                      title: Text(
                        "Share",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 15),
                      ),
                      backgroundColor:
                          Theme.of(context).colorScheme.onBackground,
                      borderColor: Colors.transparent,
                      fun: () {
                        _showShareBottomSheet();
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      _showReportBottomSheet();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onBackground,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: const EdgeInsets.all(13),
                      child: Image.asset(
                        "assets/icon/icon_view_more.png",
                        width: screenWidth * 7 / 180,
                        height: screenWidth * 7 / 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  _showSaveBottomSheet() {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return CommonTextWithCloseHeaderBottomSheet(
          title: "Save this post",
          childWidget: Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.5),
                  child: Text(
                    "In my library",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _showShareBottomSheet() {
    final screenWidth = MediaQuery.of(context).size.width;
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return CommonTextWithCloseHeaderBottomSheet(
          title: "Share this post",
          childWidget: SizedBox(
            height: screenWidth / 3,
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(shares[index].image),
                      radius: screenWidth * 7 / 72,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      shares[index].title,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 15),
              itemCount: shares.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
          ),
        );
      },
    );
  }

  _showReportBottomSheet() {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return CommonTextWithCloseHeaderBottomSheet(
          title: "Reporting this post for",
          childWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  _reportEnd();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.5),
                  child: Text(
                    "Its a spam post",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _reportEnd();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.5),
                  child: Text(
                    "Naked image or sexual behavior.",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _reportEnd();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.5),
                  child: Text(
                    "hate speech or violent content.",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _reportEnd() {
    Get.back();
    showDialog(
      context: context,
      builder: (context) {
        return const ReportDialog();
      },
    );
  }
}
