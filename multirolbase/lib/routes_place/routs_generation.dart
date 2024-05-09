import 'dart:js';

import 'package:flutter/material.dart';
import 'package:multirolbase/home_screen.dart';
import 'package:multirolbase/login_screen.dart';
import 'package:multirolbase/routes_place/routes.dart';
import 'package:multirolbase/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.homescreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RoutesNames.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RoutesNames.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(child: Text('you are at wrong route')),
          );
        });
    }
  }
}
