import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportDialog extends StatelessWidget {
  const ReportDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      title: Text(
        "Reported",
        style: Theme.of(context).textTheme.headlineLarge,
      ),
      content: Text(
        "The report for this post has been completed. I'll review it as soon as possible. Thank you.",
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
