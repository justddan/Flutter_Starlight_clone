import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlight_clone/components/common_button.dart';
import 'package:starlight_clone/screens/login/terms_screen.dart';
import 'package:starlight_clone/screens/main_screen.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/login";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x001e1d1b),
      body: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bg_login.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.7, 1],
                  ),
                ),
              ),
            ),
            const Positioned(
              child: Align(
                child: FractionallySizedBox(
                  widthFactor: 0.5,
                  child: Image(
                    image: AssetImage("assets/images/logo.png"),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Start with",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonButton(
                    title: "Facebook",
                    backgroundColor: Theme.of(context).colorScheme.onBackground,
                    borderColor: Theme.of(context).colorScheme.onSurface,
                    prefixIcon: "assets/icon/icon_facebook.png",
                    prefixWidth: 30,
                    prefixHeight: 30,
                    fun: () => Get.to(() => const TermsScreen()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonButton(
                    title: "Google",
                    backgroundColor: Theme.of(context).colorScheme.onBackground,
                    borderColor: Theme.of(context).colorScheme.onSurface,
                    prefixIcon: "assets/icon/icon_google.png",
                    prefixWidth: 30,
                    prefixHeight: 30,
                    fun: () => Get.off(() => const MainScreen()),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
