import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlight_clone/components/common_button.dart';
import 'package:starlight_clone/models/mypage/withdrawal.dart';

class WithdrawalScreen extends StatefulWidget {
  const WithdrawalScreen({super.key});

  @override
  State<WithdrawalScreen> createState() => _WithdrawalScreenState();
}

class _WithdrawalScreenState extends State<WithdrawalScreen> {
  int selectedId = 0;

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
          "Withdrawal",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hey 'soowhatt'.\nIt's so sad to say good bye.",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 20),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Deleting an account will delete all previously created posts, comments, stardust, etc. You cannot rejoin for 7 days after deleting your account.",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.white.withOpacity(0.6)),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Please let us know why you want to quit our service.",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 20),
            ),
            const SizedBox(
              height: 15,
            ),
            CommonButton(
              title: reasons[selectedId].title,
              backgroundColor: Theme.of(context).colorScheme.surface,
              borderColor: selectedId != 0 ? Colors.white : Colors.transparent,
              suffixIcon: "assets/icon/icon_down_arrow.png",
              suffixWidth: screenWidth / 18,
              suffixHeight: screenWidth / 18,
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
                                    "Select your answer",
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
                                itemCount: reasons.length - 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return CommonButton(
                                    title: reasons[index + 1].title,
                                    backgroundColor:
                                        Theme.of(context).colorScheme.surface,
                                    borderColor: Colors.transparent,
                                    fun: () {
                                      bottomState(() {
                                        setState(() {
                                          selectedId = index + 1;
                                        });
                                      });
                                      Get.back();
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
            Visibility(
              visible: selectedId != 0,
              child: Row(
                children: [
                  Flexible(
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onSurface,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                        ),
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Cancel",
                              style: Theme.of(context).textTheme.headlineSmall,
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
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                        ),
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Confirm",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
