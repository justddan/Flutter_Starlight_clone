import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoneDialog extends StatelessWidget {
  const DoneDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return AlertDialog(
      actionsPadding: const EdgeInsets.only(bottom: 20, right: 20),
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      title: Row(
        children: [
          Container(
            width: screenWidth * 5 / 36,
            height: screenWidth * 5 / 36,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(
              "assets/icon/icon_stardust.png",
              width: 20,
              height: 20,
              fit: BoxFit.contain,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            "Stardust x100",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
      content: Text(
        "Register your favorite artist and get Stardust.",
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: const Color(0xFFA4A29E),
            ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            "Close",
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: Theme.of(context).colorScheme.primary),
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
