import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color borderColor;
  final Color? titleColor;
  final String? prefixIcon;
  final double? prefixWidth;
  final double? prefixHeight;
  final Color? prefixIconColor;
  final String? suffixText;
  final String? suffixIcon;
  final double? suffixWidth;
  final double? suffixHeight;
  final Function fun;

  const CommonButton({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.borderColor,
    required this.fun,
    this.titleColor,
    this.prefixIcon,
    this.prefixWidth,
    this.prefixHeight,
    this.prefixIconColor,
    this.suffixText,
    this.suffixIcon,
    this.suffixWidth,
    this.suffixHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          fun();
        },
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: BorderSide(
            width: 1,
            color: borderColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Visibility(
                  visible: prefixIcon != null,
                  child: Image(
                    image: AssetImage(prefixIcon ?? ""),
                    width: prefixWidth ?? 0,
                    height: prefixHeight ?? 0,
                    color: prefixIconColor,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: titleColor),
                ),
              ],
            ),
            Row(
              children: [
                Visibility(
                  visible: suffixText != null,
                  child: Text(
                    suffixText ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 13),
                  ),
                ),
                Visibility(
                  visible: suffixIcon != null,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Image(
                        image: AssetImage(suffixIcon ?? ""),
                        width: suffixWidth ?? 0,
                        height: suffixHeight ?? 0,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
