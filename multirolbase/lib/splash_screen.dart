import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multirolbase/home_screen.dart';
import 'package:multirolbase/login_screen.dart';
import 'package:multirolbase/routes_place/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    islogin();
  }

  void islogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool islogin = sp.getBool('islogin') ?? false;
    if (islogin) {
      Timer(const Duration(seconds: 4), () {
        Navigator.pushNamed(context, RoutesNames.homescreen);
      });
    } else {
      Timer(const Duration(seconds: 4), () {
        Navigator.pushNamed(context, RoutesNames.loginScreen);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
          height: double.infinity,
          fit: BoxFit.fill,
          image: NetworkImage(
              'https://images.pexels.com/photos/1816225/pexels-photo-1816225.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')),
    );
  }
}
