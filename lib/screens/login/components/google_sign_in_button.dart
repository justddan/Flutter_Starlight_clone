import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:starlight_clone/components/common_button.dart';
import 'package:starlight_clone/screens/main_screen.dart';
import 'package:starlight_clone/util/auth.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonButton(
      title: "Google",
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      borderColor: Theme.of(context).colorScheme.onSurface,
      prefixIcon: "assets/icon/icon_google.png",
      prefixWidth: 30,
      prefixHeight: 30,
      fun: () async {
        User? user = await Auth.signInWithGoogle(context: context);

        if (user != null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const MainScreen()),
          );
        }
      },
    );
  }
}
