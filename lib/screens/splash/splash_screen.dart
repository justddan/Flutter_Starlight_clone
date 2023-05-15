import 'package:flutter/material.dart';
import 'package:starlight_clone/screens/login/login_screen.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    });
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          "assets/images/logo.png",
          width: screenWidth / 2,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
