import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackDialog extends StatelessWidget {
  const BackDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.only(bottom: 20, right: 20),
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      title: Text(
        "Dismiss all the selections?",
        style: Theme.of(context).textTheme.headlineLarge,
      ),
      content: Text(
        "If you leave now, all selections will be deleted.",
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: const Color(0xFFA4A29E),
            ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
            Get.back();
          },
          child: Text(
            "Leave now",
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
  }
}
