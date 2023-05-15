import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlight_clone/components/common_short_radius_button.dart';
import 'package:starlight_clone/models/home/idol_category.dart';
import 'package:starlight_clone/screens/home/tabs/favorite_screen.dart';
import 'package:starlight_clone/screens/home/tabs/group_screen.dart';
import 'package:starlight_clone/screens/stardust/stardust_screen.dart';
import 'package:starlight_clone/util/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int hour = 0;
  int minute = 0;
  int second = 0;

  @override
  void initState() {
    super.initState();
    hour = 0;
    minute = 0;
    second = 0;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final countdownTime = DateTime(2100);

    Timer.periodic(const Duration(seconds: 1), (_) {
      final now = DateTime.now();
      final distance =
          countdownTime.millisecondsSinceEpoch - now.millisecondsSinceEpoch;
      final hours =
          ((distance % (24 * 60 * 60 * 1000)) / (1000 * 60 * 60)).floor();
      final minutes = ((distance % (60 * 60 * 1000)) / (1000 * 60)).floor();
      final seconds = ((distance % (60 * 1000)) / 1000).floor();
      if (mounted) {
        setState(() {
          hour = hours;
          minute = minutes;
          second = seconds;
        });
      }
    });

    return DefaultTabController(
      initialIndex: 0,
      length: idolCategories.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(115),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black,
            title: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0, 2),
                          )
                        ]),
                    child: Text(
                      "Today's vote ${hour >= 10 ? hour : "0$hour"}:${minute >= 10 ? minute : "0$minute"}:${second >= 10 ? second : "0$second"}",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                CommonShortRadiusButton(
                  paddingVertical: 10,
                  paddingHorizontal: 20,
                  title: Text(
                    numberFormat.format(14028),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  borderColor: Colors.transparent,
                  prefixIcon: "assets/icon/icon_stardust.png",
                  prefixColor: Theme.of(context).colorScheme.primary,
                  prefixWidth: screenWidth / 18,
                  fun: () {
                    Get.to(() => const StardustScreen());
                  },
                )
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: TabBar(
                isScrollable: true,
                indicatorColor: Colors.transparent,
                tabs: List.generate(
                  idolCategories.length,
                  (index) => Tab(
                    child: Text(idolCategories[index].name),
                  ),
                ),
                labelColor: Colors.white,
                labelStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 24,
                    ),
                unselectedLabelColor: Theme.of(context).hintColor,
                unselectedLabelStyle:
                    Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 20,
                        ),
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            GroupScreen(
              id: "1",
            ),
            GroupScreen(
              id: "0",
            ),
            GroupScreen(
              id: "2",
            ),
            GroupScreen(
              id: "3",
            ),
            FavoriteScreen(),
          ],
        ),
      ),
    );
  }
}
