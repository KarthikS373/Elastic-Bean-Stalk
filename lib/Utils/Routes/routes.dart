import 'package:flutter/material.dart';

import 'package:elastic_bean_stalk/Screen/HomeScreen/homeScreen.dart';
import 'package:elastic_bean_stalk/Screen/LoginScreen/loginScreen.dart';
import 'package:elastic_bean_stalk/Screen/SignupScreen/signupScreen.dart';

class RouteManager {
  // Routes
  static const String home = '/';
  static const String login = '/login';
  static const String signup = '/signup';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    //Arguments
    var args;
    if (settings.arguments != null) {
      args = settings.arguments as Map<String, dynamic>;
    }

    // Route Switching
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (ctx) => const HomeScreen());

      case login:
        return MaterialPageRoute(builder: (ctx) => const LoginScreen());

      case signup:
        return MaterialPageRoute(builder: (ctx) => const SignupScreen());

      default:
        throw const FormatException("Invalid Route");
    }
  }
}
