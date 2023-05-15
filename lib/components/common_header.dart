import 'package:flutter/material.dart';

class CommonHeader extends StatelessWidget {
  final String? prefixButtonIcon;
  final Function? prefixFun;
  final String? suffixButtonIcon;
  final Function? suffixFun;
  final String title;

  const CommonHeader({
    super.key,
    required this.title,
    this.prefixButtonIcon,
    this.prefixFun,
    this.suffixButtonIcon,
    this.suffixFun,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 7, right: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          prefixButtonIcon != null
              ? GestureDetector(
                  child: Container(
                    width: screenWidth / 60,
                    height: screenWidth / 30,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage(prefixButtonIcon!),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  onTap: () {
                    prefixFun!();
                  },
                )
              : Container(),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          suffixButtonIcon != null
              ? GestureDetector(
                  child: Container(
                    width: screenWidth / 60,
                    height: screenWidth / 30,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage(suffixButtonIcon!),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  onTap: () {
                    suffixFun!();
                  },
                )
              : Container(),
        ],
      ),
    );
  }
}
