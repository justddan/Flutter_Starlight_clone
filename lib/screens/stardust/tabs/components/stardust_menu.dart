import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlight_clone/components/common_short_radius_button.dart';
import 'package:starlight_clone/screens/stardust/product_screen.dart';
import 'package:starlight_clone/util/constant.dart';

class StardustMenu extends StatelessWidget {
  final String number, price;

  const StardustMenu({
    super.key,
    required this.number,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // var f = NumberFormat('###,###');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Image(
                    image: const AssetImage("assets/icon/icon_stardust.png"),
                    color: Theme.of(context).colorScheme.primary,
                    width: screenWidth / 18,
                    height: screenWidth / 18,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Stardust x${numberFormat.format(int.parse(number))}",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
        CommonShortRadiusButton(
          paddingVertical: 10,
          paddingHorizontal: 15,
          title: Text(
            "${numberFormat.format(int.parse(price))} KRW",
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Colors.black),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          borderColor: Colors.white.withOpacity(0.5),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
            )
          ],
          fun: () {
            Get.to(() => const ProductScreen());
          },
        )
      ],
    );
  }
}
