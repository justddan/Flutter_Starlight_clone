import 'package:flutter/material.dart';

class CommonSubTextContainer extends StatelessWidget {
  final Color backgroundColor;
  final String? prefixIcon;
  final Color? prefixIconColor;
  final String? title;
  final String? suffixText;
  final String? subText;
  final Color? subTextColor;

  const CommonSubTextContainer({
    super.key,
    required this.backgroundColor,
    this.prefixIcon,
    this.prefixIconColor,
    this.title,
    this.suffixText,
    this.subText,
    this.subTextColor,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: title != null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Visibility(
                      visible: prefixIcon != null,
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage(prefixIcon ?? ""),
                            width: screenWidth / 18,
                            height: screenWidth / 18,
                            color: prefixIconColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      title ?? "",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                Text(
                  suffixText ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 13),
                ),
              ],
            ),
          ),
          Visibility(
            visible: subText != null && title != null,
            child: const SizedBox(
              height: 17,
            ),
          ),
          Visibility(
            visible: subText != null,
            child: Column(
              children: [
                Text(
                  subText ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: subTextColor),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
