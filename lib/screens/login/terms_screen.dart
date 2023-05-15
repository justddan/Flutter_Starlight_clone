import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlight_clone/components/common_radius_button.dart';
import 'package:starlight_clone/screens/login/components/terms_title.dart';
import 'package:starlight_clone/screens/login/profile_screen.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({super.key});

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  bool isTerms = false;
  bool isPolicy = false;

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
          "New Account",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TermsTitle(
                      title: "Terms of conditions.",
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isTerms = !isTerms;
                            });
                          },
                          child: Icon(
                            Icons.check,
                            size: screenWidth / 24,
                            color:
                                Color.fromRGBO(0, 210, 233, isTerms ? 1 : 0.3),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            "I accept the terms of conditions.",
                            style: Theme.of(context).textTheme.displayMedium,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TermsTitle(
                      title: "Policy of personal information.",
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isPolicy = !isPolicy;
                            });
                          },
                          child: Icon(
                            Icons.check,
                            size: screenWidth / 24,
                            color:
                                Color.fromRGBO(0, 210, 233, isPolicy ? 1 : 0.3),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            "I am over 14 years old, and I accept the terms of conditions.",
                            style: Theme.of(context).textTheme.displayMedium,
                            maxLines: 2,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Visibility(
              visible: isTerms && isPolicy,
              child: CommonRadiusButton(
                backgroundColor: Theme.of(context).colorScheme.primary,
                borderColor: Theme.of(context).colorScheme.primary,
                buttonText: "Next",
                buttonTextColor: Colors.black,
                fun: () => Get.to(const ProfileScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
