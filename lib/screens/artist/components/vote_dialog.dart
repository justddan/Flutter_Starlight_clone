import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VoteDialog extends StatelessWidget {
  const VoteDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      title: Text(
        "Voted",
        style: Theme.of(context).textTheme.headlineLarge,
      ),
      content: Text(
        "You have successfully completed the vote. More information can be found on My Page > Stardust.",
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
