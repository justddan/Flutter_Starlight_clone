import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlight_clone/components/common_poster.dart';
import 'package:starlight_clone/components/common_radius_button.dart';
import 'package:starlight_clone/components/common_short_radius_button.dart';
import 'package:starlight_clone/models/home/group.dart';
import 'package:starlight_clone/screens/main_screen.dart';
import 'package:starlight_clone/screens/myfavorite/components/favorite_list.dart';

class MyFavoriteScreen extends StatefulWidget {
  const MyFavoriteScreen({super.key});

  @override
  State<MyFavoriteScreen> createState() => _MyFavoriteScreenState();
}

class _MyFavoriteScreenState extends State<MyFavoriteScreen> {
  int _selectedIndex = 0;
  final List _selectedIdol = [];

  void delete(int index) {
    setState(() {
      _selectedIdol.remove(index);
    });
  }

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
          // onPressed: () => Get.back(),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  actionsPadding: const EdgeInsets.only(bottom: 20, right: 20),
                  backgroundColor: Theme.of(context).colorScheme.onBackground,
                  title: Text(
                    "Dismiss all the selections?",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  content: Text(
                    "If you leave now, all selections will be deleted.",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: const Color(0xFFA4A29E),
                        ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                        Get.back();
                      },
                      child: Text(
                        "Leave now",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: const Color(0xFFFD3A6A)),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "Cancel",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    )
                  ],
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                );
              },
            );
          },
        ),
        title: Text(
          "My Favorite",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          Visibility(
            visible: _selectedIdol != [] && _selectedIdol.isNotEmpty,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    _showDoneFavoriteBottomSheet();
                  },
                  child: Text(
                    "Done",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: _selectedIdol.isNotEmpty,
                      child: Column(
                        children: [
                          ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return FavoriteList(
                                idx: _selectedIdol[index],
                                removeFun: delete,
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 10,
                            ),
                            itemCount: _selectedIdol.length,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: _selectedIdol.length < 3,
                      child: Container(
                        width: screenWidth - 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Theme.of(context).colorScheme.surface,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: _selectedIdol.isEmpty
                              ? TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "You can add ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w300)),
                                    TextSpan(
                                      text: "3 artists.",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w300,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                    ),
                                  ],
                                )
                              : TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "You still can add ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w300)),
                                    TextSpan(
                                      text:
                                          "${3 - _selectedIdol.length} more artists.",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w300,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Finde your favorite artist",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            )
          ];
        },
        body: Column(
          children: [
            Container(
              color: Colors.black,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        TextField(
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w300,
                                  ),
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset(
                                'assets/icon/icon_search.png',
                                width: screenWidth / 22.5,
                                height: screenWidth / 22.5,
                                fit: BoxFit.contain,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 17,
                              horizontal: 15,
                            ),
                            hintText: "Search by name or group",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white.withOpacity(0.5)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.2),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                            filled: true,
                            fillColor:
                                Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            CommonShortRadiusButton(
                              paddingVertical: 10,
                              paddingHorizontal: 15,
                              title: Text(
                                "Girl Group",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                      color: _selectedIndex == 0
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                              ),
                              backgroundColor: _selectedIndex == 0
                                  ? Colors.white
                                  : Colors.black,
                              borderColor: Colors.white,
                              fun: () {
                                setState(() {
                                  _selectedIndex = 0;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            CommonShortRadiusButton(
                              paddingVertical: 10,
                              paddingHorizontal: 15,
                              title: Text(
                                "Boy Group",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                      color: _selectedIndex == 1
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                              ),
                              backgroundColor: _selectedIndex == 1
                                  ? Colors.white
                                  : Colors.black,
                              borderColor: Colors.white,
                              fun: () {
                                setState(() {
                                  _selectedIndex = 1;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            CommonShortRadiusButton(
                              paddingVertical: 10,
                              paddingHorizontal: 15,
                              title: Text(
                                "Solo",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                      color: _selectedIndex == 2
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                              ),
                              backgroundColor: _selectedIndex == 2
                                  ? Colors.white
                                  : Colors.black,
                              borderColor: Colors.white,
                              fun: () {
                                setState(() {
                                  _selectedIndex = 2;
                                });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color(0xFF5D5D5D),
                    thickness: 1,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 7.5,
                  horizontal: 15,
                ),
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  childAspectRatio: 50 / 61,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 15,
                  children: List.generate(groups.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_selectedIdol.length > 2) {
                            return;
                          } else {
                            _showSetFavoriteBottomSheet(index);
                          }
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                CommonPoster(
                                  posterUrl: groups[index].imgUrl,
                                  length: screenWidth * 5 / 18,
                                  radius: 15,
                                ),
                                Visibility(
                                  visible:
                                      _selectedIdol.contains(groups[index].id),
                                  child: Positioned(
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.black.withOpacity(0.8),
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          "assets/icon/icon_check.png",
                                          width: screenWidth / 12,
                                          height: screenWidth / 12,
                                          color: Colors.white,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            groups[index].name,
                            style: Theme.of(context).textTheme.headlineSmall,
                          )
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showSetFavoriteBottomSheet(int idx) {
    final screenWidth = MediaQuery.of(context).size.width;
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Theme.of(context).colorScheme.onBackground,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
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
                  height: 20,
                ),
                CommonPoster(
                  posterUrl: groups[idx].imgUrl,
                  length: screenWidth * 5 / 18,
                  radius: 15,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Set as your favorite?",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "You can still set ${3 - _selectedIdol.length} more artists\nas your favorite.",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white.withOpacity(0.6),
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                CommonRadiusButton(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  borderColor: Colors.transparent,
                  buttonText: "Confirm",
                  buttonTextColor: Colors.black,
                  fun: () {
                    setState(() {
                      _selectedIdol.add(groups[idx].id);
                    });
                    Get.back();
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    "Cancel",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  _showDoneFavoriteBottomSheet() {
    final screenWidth = MediaQuery.of(context).size.width;
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Theme.of(context).colorScheme.onBackground,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
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
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: screenWidth * 5 / 18,
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return CommonPoster(
                            posterUrl: groups[_selectedIdol[index]].imgUrl,
                            length: screenWidth * 5 / 18,
                            radius: 15,
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 8,
                        ),
                        itemCount: _selectedIdol.length,
                      ),
                    ),
                    Visibility(
                      visible: _selectedIdol.length != 3,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 8,
                          ),
                          SizedBox(
                            height: screenWidth / 6,
                            child: ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: screenWidth / 6,
                                  height: screenWidth / 6,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                width: 8,
                              ),
                              itemCount: 3 - _selectedIdol.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Set as your favorite?",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  _selectedIdol.length == 3
                      ? "You used all the favorite slots.\nIf you confirm your decesion, you can get\n free stardust."
                      : "You can still set ${3 - _selectedIdol.length} more artists\nas your favorite.",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white.withOpacity(0.6),
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                CommonRadiusButton(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  borderColor: Colors.transparent,
                  buttonText: _selectedIdol.length == 3
                      ? "Confirm and get 30 stardust"
                      : "Finish and get 30 stardust",
                  buttonTextColor: Colors.black,
                  fun: () {
                    Get.offAll(() => const MainScreen());
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          actionsPadding:
                              const EdgeInsets.only(bottom: 20, right: 20),
                          backgroundColor:
                              Theme.of(context).colorScheme.onBackground,
                          title: Row(
                            children: [
                              Container(
                                width: screenWidth * 5 / 36,
                                height: screenWidth * 5 / 36,
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Image.asset(
                                  "assets/icon/icon_stardust.png",
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.contain,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Stardust x100",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                          content: Text(
                            "Register your favorite artist and get Stardust.",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: const Color(0xFFA4A29E),
                                ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text(
                                "Close",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                              ),
                            )
                          ],
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    _selectedIdol.length == 3 ? "Not yet" : "Cancel",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
