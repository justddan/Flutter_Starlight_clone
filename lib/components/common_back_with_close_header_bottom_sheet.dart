import 'package:flutter/material.dart';

class CommonBackWithCloseHeaderBottomSheet extends StatelessWidget {
  final Function backFun;
  final Function closeFun;
  final Widget childWidget;

  const CommonBackWithCloseHeaderBottomSheet({
    super.key,
    required this.backFun,
    required this.closeFun,
    required this.childWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.onBackground,
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  backFun();
                },
                child: const Image(
                  image: AssetImage("assets/icon/icon_left_check.png"),
                  width: 14,
                  height: 14,
                ),
              ),
              GestureDetector(
                onTap: () {
                  closeFun();
                },
                child: const Image(
                  image: AssetImage("assets/icon/icon_cancel.png"),
                  width: 14,
                  height: 14,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          childWidget,
        ],
      ),
    );
  }
}
