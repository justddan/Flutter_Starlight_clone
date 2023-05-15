import 'package:flutter/material.dart';
import 'package:starlight_clone/components/common_button_with_right_check.dart';

class TermsTitle extends StatelessWidget {
  final String title;
  const TermsTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 10,
        ),
        CommonButtonWithRightCheck(
          title: "Check the details",
          backgroundColor: Theme.of(context).colorScheme.surface,
          borderColor: Colors.black,
          fun: () {},
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
