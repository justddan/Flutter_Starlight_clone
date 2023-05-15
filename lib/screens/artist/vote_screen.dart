import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:starlight_clone/components/common_radius_button.dart';
import 'package:starlight_clone/components/common_short_radius_button.dart';
import 'package:starlight_clone/components/common_sub_text_container.dart';
import 'package:starlight_clone/util/constant.dart';

class VoteScreen extends StatelessWidget {
  const VoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController numberController = TextEditingController();

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
          "Vote",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: Column(
          children: [
            Flexible(
              child: Center(
                child: TextField(
                  showCursor: false,
                  controller: numberController,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(fontSize: 25),
                  decoration: InputDecoration(
                    hintText: "Enter the vote counts",
                    hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 25,
                          color: Colors.white.withOpacity(0.3),
                        ),
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    ThousandsSeparatorInputFormatter()
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Flexible(
                  child: CommonShortRadiusButton(
                    paddingVertical: 10,
                    paddingHorizontal: 18,
                    title: Text(
                      "+1",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    backgroundColor: Colors.black,
                    borderColor: Colors.white,
                    fun: () {
                      if (numberController.value.text.isEmpty ||
                          numberController.value.text == "0") {
                        numberController.text = "1";
                      } else {
                        numberController.text = (numberFormat.format(int.parse(
                                    numberController.value.text
                                        .replaceAll(",", "")) +
                                1))
                            .toString();
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
                    paddingHorizontal: 18,
                    title: Text(
                      "+10",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    backgroundColor: Colors.black,
                    borderColor: Colors.white,
                    fun: () {
                      if (numberController.value.text.isEmpty ||
                          numberController.value.text == "0") {
                        numberController.text = "10";
                      } else {
                        numberController.text = (numberFormat.format(int.parse(
                                    numberController.value.text
                                        .replaceAll(",", "")) +
                                10))
                            .toString();
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
                    paddingHorizontal: 18,
                    title: Text(
                      "+50",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    backgroundColor: Colors.black,
                    borderColor: Colors.white,
                    fun: () {
                      if (numberController.value.text.isEmpty ||
                          numberController.value.text == "0") {
                        numberController.text = "50";
                      } else {
                        numberController.text = (numberFormat.format(int.parse(
                                    numberController.value.text
                                        .replaceAll(",", "")) +
                                50))
                            .toString();
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
                    paddingHorizontal: 18,
                    title: Text(
                      "+100",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    backgroundColor: Colors.black,
                    borderColor: Colors.white,
                    fun: () {
                      if (numberController.value.text.isEmpty ||
                          numberController.value.text == "0") {
                        numberController.text = "100";
                      } else {
                        numberController.text = (numberFormat.format(int.parse(
                                    numberController.value.text
                                        .replaceAll(",", "")) +
                                100))
                            .toString();
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
                    paddingHorizontal: 18,
                    title: Text(
                      "+All",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    backgroundColor: Colors.black,
                    borderColor: Colors.white,
                    fun: () {
                      if (numberController.value.text.isEmpty) {
                        numberController.text = "14,028";
                      } else {
                        numberController.text = "14,028";
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            CommonSubTextContainer(
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              prefixIcon: "assets/icon/icon_stardust.png",
              prefixIconColor: Theme.of(context).colorScheme.primary,
              title: "Your stardust",
              suffixText: numberFormat.format(14028),
            ),
            const SizedBox(
              height: 15,
            ),
            CommonRadiusButton(
              backgroundColor: Theme.of(context).colorScheme.primary,
              borderColor: Colors.transparent,
              buttonText: "Vote",
              buttonTextColor: Colors.black,
              fun: () {
                if (numberController.value.text.isNotEmpty) {
                  if (int.parse(numberController.value.text
                              .replaceAll(",", "")) <=
                          14028 &&
                      numberController.value.text != "0") {
                    Get.back();
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor:
                              Theme.of(context).colorScheme.onBackground,
                          title: Text(
                            "Voted",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          content: Text(
                            "You have successfully completed the vote. More information can be found on My Page > Stardust.",
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
                  } else {
                    return;
                  }
                } else {
                  return;
                }
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
            )
          ],
        ),
      ),
    );
  }
}

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  static const separator = ','; // Change this to '.' for other locales

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Short-circuit if the new value is empty
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Handle "deletion" of separator character
    String oldValueText = oldValue.text.replaceAll(separator, '');
    String newValueText = newValue.text.replaceAll(separator, '');

    if (oldValue.text.endsWith(separator) &&
        oldValue.text.length == newValue.text.length + 1) {
      newValueText = newValueText.substring(0, newValueText.length - 1);
    }

    // Only process if the old value and new value are different
    if (oldValueText != newValueText) {
      int selectionIndex =
          newValue.text.length - newValue.selection.extentOffset;
      final chars = newValueText.split('');

      String newString = '';
      for (int i = chars.length - 1; i >= 0; i--) {
        if ((chars.length - 1 - i) % 3 == 0 && i != chars.length - 1) {
          newString = separator + newString;
        }
        newString = chars[i] + newString;
      }

      return TextEditingValue(
        text: newString.toString(),
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndex,
        ),
      );
    }

    // If the new value and old value are the same, just return as-is
    return newValue;
  }
}
