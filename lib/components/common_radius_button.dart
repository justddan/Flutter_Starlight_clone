import 'package:flutter/material.dart';

class CommonRadiusButton extends StatelessWidget {
  final Color backgroundColor, borderColor, buttonTextColor;
  final String buttonText;
  final Function fun;

  const CommonRadiusButton({
    super.key,
    required this.backgroundColor,
    required this.borderColor,
    required this.buttonText,
    required this.buttonTextColor,
    required this.fun,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        fun();
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        side: BorderSide(
          width: 1,
          color: borderColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            buttonText,
            style: TextStyle(
              color: buttonTextColor,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
