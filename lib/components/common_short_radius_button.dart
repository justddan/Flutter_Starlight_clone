import 'package:flutter/material.dart';

class CommonShortRadiusButton extends StatelessWidget {
  final Text title;
  final Color backgroundColor;
  final Color borderColor;
  final double paddingVertical;
  final double paddingHorizontal;
  final List<BoxShadow>? boxShadow;
  final String? prefixIcon;
  final double? prefixWidth;
  final Color? prefixColor;
  final String? suffixIcon;
  final double? suffixWidth;
  final String? suffixColor;
  final Function? suffixFun;
  final Function fun;

  const CommonShortRadiusButton({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.borderColor,
    required this.fun,
    required this.paddingVertical,
    required this.paddingHorizontal,
    this.boxShadow,
    this.prefixIcon,
    this.prefixWidth,
    this.prefixColor,
    this.suffixIcon,
    this.suffixWidth,
    this.suffixColor,
    this.suffixFun,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        fun();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: paddingVertical,
          horizontal: paddingHorizontal,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: borderColor,
          ),
          boxShadow: boxShadow,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: prefixIcon != null,
              child: Row(
                children: [
                  Image.asset(
                    prefixIcon ?? "",
                    color: prefixColor,
                    width: prefixWidth,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
            title,
          ],
        ),
      ),
    );
  }
}
