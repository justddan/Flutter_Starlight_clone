import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonCloseHeaderBottomSheet extends StatelessWidget {
  final Widget childWidget;
  final double paddingVertical;
  final double paddingHorizontal;

  const CommonCloseHeaderBottomSheet({
    super.key,
    required this.childWidget,
    required this.paddingVertical,
    required this.paddingHorizontal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.onBackground,
      padding: EdgeInsets.symmetric(
        vertical: paddingVertical,
        horizontal: paddingHorizontal,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
            height: 20,
          ),
          childWidget,
        ],
      ),
    );
  }
}
