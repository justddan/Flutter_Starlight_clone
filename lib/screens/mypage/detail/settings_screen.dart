import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlight_clone/components/common_button.dart';
import 'package:starlight_clone/components/common_button_with_right_check.dart';
import 'package:starlight_clone/components/common_sub_text_container.dart';
import 'package:starlight_clone/models/mypage/language.dart';
import 'package:starlight_clone/screens/mypage/detail/withdrawal_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDark = true;
  bool isPush = true;
  int selectedId = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
          "Settings",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            CommonSubTextContainer(
              backgroundColor: Theme.of(context).colorScheme.surface,
              prefixIcon: "assets/icon/icon_app_version.png",
              prefixIconColor: Colors.white,
              title: "App version",
              suffixText: "1.0",
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      Image(
                        image: const AssetImage(
                          "assets/icon/icon_light_dark_mode.png",
                        ),
                        width: screenWidth / 18,
                        height: screenWidth / 18,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Light / Dark mode",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isDark = false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isDark ? Colors.transparent : Colors.black,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color:
                                    isDark ? Colors.white : Colors.transparent,
                              ),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Light",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isDark = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color:
                                    isDark ? Colors.transparent : Colors.black,
                              ),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Dark",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image(
                        image: const AssetImage("assets/icon/icon_push.png"),
                        width: screenWidth / 18,
                        height: screenWidth / 18,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Push notification",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: screenWidth / 9,
                    height: screenWidth / 15,
                    child: CupertinoSwitch(
                      activeColor: Theme.of(context).colorScheme.primary,
                      trackColor: Theme.of(context).colorScheme.surface,
                      thumbColor: Colors.black,
                      value: isPush,
                      onChanged: (value) {
                        setState(() {
                          isPush = value;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CommonButtonWithRightCheck(
              title: "Language",
              backgroundColor: Theme.of(context).colorScheme.surface,
              borderColor: Colors.transparent,
              prefixIcon: "assets/icon/icon_language.png",
              prefixWidth: screenWidth / 18,
              prefixHeight: screenWidth / 18,
              prefixIconColor: Colors.white,
              suffixText: languages[selectedId].title,
              fun: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return StatefulBuilder(
                      builder: (BuildContext context, StateSetter bottomState) {
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Language",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: const Image(
                                      image: AssetImage(
                                        "assets/icon/icon_cancel.png",
                                      ),
                                      width: 14,
                                      height: 14,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              ListView.separated(
                                shrinkWrap: true,
                                itemCount: languages.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return CommonButton(
                                    title: languages[index].language,
                                    titleColor: selectedId == index
                                        ? Colors.black
                                        : Colors.white,
                                    backgroundColor: selectedId == index
                                        ? Colors.white
                                        : Theme.of(context).colorScheme.surface,
                                    borderColor: Colors.transparent,
                                    suffixIcon: selectedId == index
                                        ? "assets/icon/icon_check.png"
                                        : null,
                                    suffixWidth: screenWidth * 7 / 180,
                                    suffixHeight: screenWidth * 7 / 180,
                                    fun: () {
                                      bottomState(() {
                                        setState(() {
                                          selectedId = index;
                                        });
                                      });
                                    },
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 15),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CommonButtonWithRightCheck(
              title: "Withdrawal",
              backgroundColor: Theme.of(context).colorScheme.surface,
              borderColor: Colors.transparent,
              prefixIcon: "assets/icon/icon_withdrawal.png",
              prefixWidth: screenWidth / 18,
              prefixHeight: screenWidth / 18,
              prefixIconColor: Colors.white,
              fun: () {
                Get.to(() => const WithdrawalScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
