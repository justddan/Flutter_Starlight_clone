import 'package:flutter/material.dart';
import 'package:starlight_clone/screens/home/home_screen.dart';
import 'package:starlight_clone/screens/honnor/honnor_screen.dart';
import 'package:starlight_clone/screens/mypage/my_page_screen.dart';
import 'package:starlight_clone/screens/reward/reward_screen.dart';
import 'package:starlight_clone/screens/search/search_screen.dart';

class MainScreen extends StatefulWidget {
  static String routeName = "/main";
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          HomeScreen(),
          HonnorScreen(),
          RewardScreen(),
          SearchScreen(),
          MyPageScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/icon/icon_home.png"),
            ),
            backgroundColor: Colors.black,
            label: "",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/icon/icon_favorite.png"),
            ),
            backgroundColor: Colors.black,
            label: "",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/icon/icon_trophy.png"),
            ),
            backgroundColor: Colors.black,
            label: "",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/icon/icon_search.png"),
            ),
            backgroundColor: Colors.black,
            label: "",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/icon/icon_mypage.png"),
            ),
            backgroundColor: Colors.black,
            label: "",
          ),
        ],
      ),
    );
  }
}
