import 'package:flutter/material.dart';
import 'package:starlight_clone/screens/login/login_screen.dart';
import 'package:starlight_clone/screens/main_screen.dart';
import 'package:starlight_clone/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> route = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  MainScreen.routeName: (context) => const MainScreen(),
};
