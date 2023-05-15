import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlight_clone/components/common_button.dart';
import 'package:starlight_clone/components/common_radius_button.dart';
import 'package:starlight_clone/components/common_short_radius_button.dart';
import 'package:starlight_clone/models/stardust/gain_stardust.dart';
import 'package:starlight_clone/screens/stardust/tabs/components/gain_list.dart';
import 'package:starlight_clone/util/constant.dart';

class GainScreen extends StatefulWidget {
  const GainScreen({super.key});

  @override
  State<GainScreen> createState() => _GainScreenState();
}

class _GainScreenState extends State<GainScreen> {
  DateTime from = DateTime.now();
  DateTime to = DateTime.now();
  late var fromDate = dateFormat.format(from);
  late var toDate = dateFormat.format(to);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    bool dateValidate = to.difference(from).inDays >= 0;
    bool isPickDate = from.difference(DateTime.now()).inDays != 0 ||
        to.difference(DateTime.now()).inDays != 0;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              isPickDate && dateValidate
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icon/icon_daily.png",
                            color: Colors.black,
                            width: screenWidth / 24,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "$fromDate - $toDate",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: Colors.black,
                                ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                from = DateTime.now();
                                to = DateTime.now();
                                fromDate = dateFormat.format(from);
                                toDate = dateFormat.format(to);
                              });
                            },
                            child: Image.asset(
                              "assets/icon/icon_cancel.png",
                              color: Colors.black,
                              width: screenWidth / 36,
                            ),
                          )
                        ],
                      ),
                    )
                  : CommonShortRadiusButton(
                      paddingVertical: 10,
                      paddingHorizontal: 15,
                      prefixIcon: "assets/icon/icon_daily.png",
                      prefixWidth: screenWidth / 24,
                      prefixColor: Colors.white,
                      title: Text(
                        "Select the date",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      backgroundColor:
                          Theme.of(context).colorScheme.onBackground,
                      borderColor: Colors.transparent,
                      fun: _showSelectDateBottomSheet,
                    ),
              const SizedBox(
                width: 5,
              ),
              CommonShortRadiusButton(
                paddingVertical: 10,
                paddingHorizontal: 15,
                prefixIcon: "assets/icon/icon_search.png",
                prefixWidth: screenWidth / 24,
                prefixColor: Colors.white,
                title: Text(
                  "Search",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                backgroundColor: Theme.of(context).colorScheme.onBackground,
                borderColor: Colors.transparent,
                fun: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GainList(
                  date: gainStardusts[index].date,
                  title: gainStardusts[index].title,
                  balance: gainStardusts[index].balance,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
              itemCount: gainStardusts.length,
            ),
          ),
        ],
      ),
    );
  }

  _showSelectDateBottomSheet() {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Theme.of(context).colorScheme.onBackground,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Select the date",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
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
                  height: 15,
                ),
                Row(
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "From",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: Colors.white.withOpacity(0.6)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CommonButton(
                            title: fromDate,
                            backgroundColor:
                                Theme.of(context).colorScheme.surface,
                            borderColor: Colors.transparent,
                            fun: () {
                              Get.back();
                              _showDatePickBottomSheet(true);
                            },
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "To",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: Colors.white.withOpacity(0.6)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CommonButton(
                            title: toDate,
                            backgroundColor:
                                Theme.of(context).colorScheme.surface,
                            borderColor: Colors.transparent,
                            fun: () {
                              Get.back();
                              _showDatePickBottomSheet(false);
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  _showDatePickBottomSheet(bool isFrom) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        final screenWidth = MediaQuery.of(context).size.width;
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter bottomState) {
            return Container(
              color: Theme.of(context).colorScheme.onBackground,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                            _showSelectDateBottomSheet();
                          },
                          child: const Image(
                            image:
                                AssetImage("assets/icon/icon_left_check.png"),
                            width: 14,
                            height: 14,
                          ),
                        ),
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
                    SizedBox(
                      height: screenWidth * 41 / 72,
                      child: CupertinoDatePicker(
                        initialDateTime: isFrom ? from : to,
                        maximumDate: DateTime.now(),
                        minimumYear: 2023,
                        maximumYear: DateTime.now().year,
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (value) async {
                          setState(() {
                            isFrom ? from = value : to = value;
                          });
                        },
                      ),
                    ),
                    CommonRadiusButton(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      borderColor: Colors.transparent,
                      buttonText: "Confirm",
                      buttonTextColor: Colors.black,
                      fun: () {
                        bottomState(() {
                          setState(() {
                            isFrom
                                ? fromDate = dateFormat.format(from)
                                : toDate = dateFormat.format(to);
                          });
                        });
                        Get.back();
                        _showSelectDateBottomSheet();
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
