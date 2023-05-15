import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlight_clone/components/common_button.dart';
import 'package:starlight_clone/components/common_poster.dart';
import 'package:starlight_clone/components/common_text_with_close_header_bottom_sheet.dart';
import 'package:starlight_clone/models/home/group.dart';

class FavoriteList extends StatefulWidget {
  final int idx;
  final Function removeFun;
  const FavoriteList({
    super.key,
    required this.idx,
    required this.removeFun,
  });

  @override
  State<FavoriteList> createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CommonPoster(
                posterUrl: groups[widget.idx].imgUrl,
                length: screenWidth * 5 / 36,
                radius: 5),
            const SizedBox(
              width: 10,
            ),
            Text(
              groups[widget.idx].name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            _showDeleteBottomSheet();
          },
          child: Image.asset(
            "assets/icon/icon_view_more.png",
            width: screenWidth * 7 / 180,
            height: screenWidth * 7 / 180,
            color: Colors.white,
            fit: BoxFit.contain,
          ),
        )
      ],
    );
  }

  _showDeleteBottomSheet() {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return CommonTextWithCloseHeaderBottomSheet(
          title: "About this artist",
          childWidget: CommonButton(
            title: "Delete from the list",
            backgroundColor: Theme.of(context).colorScheme.surface,
            borderColor: Theme.of(context).colorScheme.surface,
            fun: () {
              Get.back();
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    actionsPadding:
                        const EdgeInsets.only(bottom: 20, right: 20),
                    backgroundColor: Theme.of(context).colorScheme.onBackground,
                    title: Text(
                      "Delete this artist from the list?",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    content: Text(
                      "The artist will be deleted from the favorite list.",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: const Color(0xFFA4A29E),
                          ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          widget.removeFun(widget.idx);
                          Get.back();
                        },
                        child: Text(
                          "Deleted",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(color: const Color(0xFFFD3A6A)),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "Cancel",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      )
                    ],
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
