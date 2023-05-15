import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlight_clone/models/home/idol_category.dart';
import 'package:starlight_clone/screens/home/tabs/favorite_screen.dart';
import 'package:starlight_clone/screens/home/tabs/group_screen.dart';
import 'package:starlight_clone/screens/honnor/select_date_screen.dart';
import 'package:starlight_clone/util/constant.dart';

class HonnorScreen extends StatefulWidget {
  const HonnorScreen({Key? key}) : super(key: key);

  @override
  State<HonnorScreen> createState() => HonnorScreenState();
}

class HonnorScreenState extends State<HonnorScreen> {
  DateTime start = DateTime.now();
  DateTime end = DateTime.now();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    void refresh(DateTime startDate, DateTime endDate) {
      setState(() {
        start = startDate;
        end = endDate;
      });
    }

    void refreshIndex(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    String titleFormat() {
      if (start.difference(end).inDays == 0) {
        return dateFormat2.format(start);
      } else {
        return "${dateFormat2.format(start)} - ${dateFormat2.format(end)}";
      }
    }

    return DefaultTabController(
      initialIndex: 0,
      length: idolCategories.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(115),
          child: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            automaticallyImplyLeading: false,
            actions: [
              GestureDetector(
                onTap: () {
                  Get.to(() => SelectDateScreen(
                        startDate: start,
                        endDate: end,
                        notifyParent: refresh,
                        selectedIndex: selectedIndex,
                        setSelected: refreshIndex,
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Image(
                    image: const AssetImage("assets/icon/icon_daily.png"),
                    width: screenWidth / 22,
                    height: screenWidth / 22,
                  ),
                ),
              )
            ],
            title: Text(
              titleFormat(),
              style: Theme.of(context).textTheme.titleMedium,
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
