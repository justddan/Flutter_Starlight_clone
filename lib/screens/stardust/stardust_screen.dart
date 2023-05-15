import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlight_clone/components/common_short_radius_button.dart';
import 'package:starlight_clone/screens/stardust/tabs/gain_screen.dart';
import 'package:starlight_clone/screens/stardust/tabs/shop_screen.dart';
import 'package:starlight_clone/screens/stardust/tabs/usage_screen.dart';
import 'package:starlight_clone/util/constant.dart';

class StardustScreen extends StatefulWidget {
  const StardustScreen({super.key});

  @override
  State<StardustScreen> createState() => _StardustScreenState();
}

class _StardustScreenState extends State<StardustScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final PageController pageController = PageController(initialPage: 0);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Stardust",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Theme.of(context).colorScheme.onPrimary,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 75,
            ),
            child: Column(
              children: [
                Text(
                  "My stardust",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icon/icon_stardust.png",
                      color: Theme.of(context).colorScheme.primary,
                      width: screenWidth / 18,
                      height: screenWidth / 18,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      numberFormat.format(18001051),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Flexible(
                      child: CommonShortRadiusButton(
                        paddingVertical: 10,
                        paddingHorizontal: 15,
                        title: Text(
                          "Shop",
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: selectedIndex == 0
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                        ),
                        backgroundColor: selectedIndex == 0
                            ? Colors.white
                            : Colors.transparent,
                        borderColor: Colors.white,
                        fun: () {
                          if (pageController.hasClients) {
                            pageController.animateToPage(
                              0,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: CommonShortRadiusButton(
                        paddingVertical: 10,
                        paddingHorizontal: 15,
                        title: Text(
                          "Usage",
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: selectedIndex == 1
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                        ),
                        backgroundColor: selectedIndex == 1
                            ? Colors.white
                            : Colors.transparent,
                        borderColor: Colors.white,
                        fun: () {
                          if (pageController.hasClients) {
                            pageController.animateToPage(
                              1,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: CommonShortRadiusButton(
                        paddingVertical: 10,
                        paddingHorizontal: 15,
                        title: Text(
                          "Gain",
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: selectedIndex == 2
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                        ),
                        backgroundColor: selectedIndex == 2
                            ? Colors.white
                            : Colors.transparent,
                        borderColor: Colors.white,
                        fun: () {
                          if (pageController.hasClients) {
                            pageController.animateToPage(
                              2,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
              children: [
                Stack(
                  children: [
                    const ShopScreen(),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: screenWidth,
                        height: screenWidth * 7 / 36,
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 15,
                        ),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/bg_ad_banner.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Free stardust",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                        color: Colors.white.withOpacity(0.5),
                                      ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Watch ad and get free Dust",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                )
                              ],
                            ),
                            CommonShortRadiusButton(
                              paddingVertical: 10,
                              paddingHorizontal: 25,
                              title: Text(
                                "Watch",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(color: Colors.black),
                              ),
                              backgroundColor: Colors.white,
                              borderColor: Colors.white,
                              fun: () {},
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const UsageScreen(),
                const GainScreen(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
