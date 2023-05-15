import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlight_clone/components/common_radius_button.dart';
import 'package:starlight_clone/util/constant.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: GestureDetector(
              onTap: () => Get.back(),
              child: const Icon(
                Icons.close_rounded,
                color: Colors.white,
              ),
            ),
          )
        ],
        title: Text(
          "Product",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  width: screenWidth / 3,
                  height: screenWidth / 3,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image(
                    image: const AssetImage("assets/icon/icon_stardust.png"),
                    color: Theme.of(context).colorScheme.primary,
                    width: screenWidth * 5 / 36,
                    height: screenWidth * 5 / 36,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "${numberFormat.format(15000)} Stardust",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(fontSize: 20),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  width: screenWidth - 30,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white.withOpacity(0.8),
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                )
              ],
            ),
            CommonRadiusButton(
              backgroundColor: Theme.of(context).colorScheme.primary,
              borderColor: Colors.transparent,
              buttonText: "Buy now - ${numberFormat.format(10000)}KRW",
              buttonTextColor: Colors.black,
              fun: () {
                Get.back();
              },
            )
          ],
        ),
      ),
    );
  }
}
