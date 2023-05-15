import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlight_clone/screens/myfavorite/my_favorite_screen.dart';
import 'package:starlight_clone/screens/mypage/detail/attendance_point_screen.dart';
import 'package:starlight_clone/screens/mypage/detail/daily_stamp_screen.dart';
import 'package:starlight_clone/screens/mypage/detail/faq_screen.dart';
import 'package:starlight_clone/screens/mypage/detail/notice_screen.dart';
import 'package:starlight_clone/screens/mypage/detail/settings_screen.dart';
import 'package:starlight_clone/screens/stardust/stardust_screen.dart';
import 'package:starlight_clone/util/constant.dart';

class MyPageMenu {
  final String title, prefixIcon;
  final Color backgroundColor;
  final int menuId;
  final Function fun;
  final String? suffixText;
  final Color? prefixColor;

  MyPageMenu({
    required this.menuId,
    required this.title,
    required this.backgroundColor,
    required this.prefixIcon,
    required this.fun,
    this.prefixColor,
    this.suffixText,
  });
}

List<MyPageMenu> myPageMenu = [
  MyPageMenu(
    menuId: 0,
    title: "Daily Stamps",
    backgroundColor: const Color.fromRGBO(251, 188, 5, 0.2),
    prefixIcon: "assets/icon/icon_daily_stamp.png",
    prefixColor: const Color.fromRGBO(251, 188, 5, 1),
    fun: () => Get.to(() => const DailyStampScreen()),
    suffixText: numberFormat.format(14028),
  ),
  MyPageMenu(
    menuId: 1,
    title: "Attendance point",
    backgroundColor: const Color.fromRGBO(251, 188, 5, 0.2),
    prefixIcon: "assets/icon/icon_daily_check.png",
    prefixColor: const Color.fromRGBO(251, 188, 5, 1),
    fun: () => Get.to(() => const AttendancePointScreen()),
    suffixText: numberFormat.format(30000),
  ),
  MyPageMenu(
    menuId: 2,
    title: "Stardust",
    backgroundColor: const Color.fromRGBO(0, 210, 223, 0.2),
    prefixIcon: "assets/icon/icon_stardust.png",
    prefixColor: const Color.fromRGBO(0, 210, 223, 1),
    fun: () => Get.to(() => const StardustScreen()),
    suffixText: numberFormat.format(14028),
  ),
  MyPageMenu(
    menuId: 3,
    title: "My favorite",
    backgroundColor: const Color.fromRGBO(255, 255, 255, 0.1),
    prefixIcon: "assets/icon/icon_favorite.png",
    fun: () => Get.to(() => const MyFavoriteScreen()),
  ),
  MyPageMenu(
    menuId: 4,
    title: "Notice",
    backgroundColor: const Color.fromRGBO(255, 255, 255, 0.1),
    prefixIcon: "assets/icon/icon_notice.png",
    fun: () => Get.to(() => const NoticeScreen()),
    suffixText: "3 News",
  ),
  MyPageMenu(
    menuId: 5,
    title: "FAQ",
    backgroundColor: const Color.fromRGBO(255, 255, 255, 0.1),
    prefixIcon: "assets/icon/icon_faq.png",
    fun: () => Get.to(() => const FAQScreen()),
  ),
  MyPageMenu(
    menuId: 6,
    title: "Settings",
    backgroundColor: const Color.fromRGBO(255, 255, 255, 0.1),
    prefixIcon: "assets/icon/icon_settings.png",
    fun: () => Get.to(() => const SettingsScreen()),
  ),
  MyPageMenu(
    menuId: 7,
    title: "Terms and conditions",
    backgroundColor: const Color.fromRGBO(255, 255, 255, 0.1),
    prefixIcon: "assets/icon/icon_terms.png",
    fun: () {},
  ),
];
