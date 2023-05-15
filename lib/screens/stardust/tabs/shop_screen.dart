import 'package:flutter/material.dart';
import 'package:starlight_clone/models/stardust/shop_stardust.dart';
import 'package:starlight_clone/screens/stardust/tabs/components/stardust_menu.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: AssetImage("assets/images/bg_sale.png"),
                  fit: BoxFit.cover,
                ),
              ),
              width: double.infinity,
              height: screenWidth * 5 / 18,
            ),
            const SizedBox(
              height: 15,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return StardustMenu(
                  number: shopStardusts[index].number,
                  price: shopStardusts[index].price,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount: shopStardusts.length,
            )
          ],
        ),
      ),
    );
  }
}
