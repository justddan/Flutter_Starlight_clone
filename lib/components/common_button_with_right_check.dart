import 'package:flutter/material.dart';
import 'package:starlight_clone/components/common_button.dart';

class CommonButtonWithRightCheck extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color borderColor;
  final String? prefixIcon;
  final double? prefixWidth;
  final double? prefixHeight;
  final Color? prefixIconColor;
  final String? suffixText;
  final Function fun;

  const CommonButtonWithRightCheck({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.borderColor,
    required this.fun,
    this.prefixIcon,
    this.prefixWidth,
    this.prefixHeight,
    this.prefixIconColor,
    this.suffixText,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return CommonButton(
      title: title,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      prefixIcon: prefixIcon,
      prefixWidth: prefixWidth,
      prefixHeight: prefixHeight,
      prefixIconColor: prefixIconColor,
      suffixIcon: "assets/icon/icon_right_check.png",
      suffixWidth: screenWidth / 30,
      suffixHeight: screenWidth / 30,
      suffixText: suffixText,
      fun: fun,
    );
  }
}
