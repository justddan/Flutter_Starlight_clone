import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonTextWithCloseHeaderBottomSheet extends StatelessWidget {
  final String title;
  final Widget childWidget;

  const CommonTextWithCloseHeaderBottomSheet({
    super.key,
    required this.title,
    required this.childWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.onBackground,
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Image(
                  image: AssetImage("assets/icon/icon_cancel.png"),
                  width: 14,
                  height: 14,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          childWidget,
        ],
      ),
    );
  }
}
