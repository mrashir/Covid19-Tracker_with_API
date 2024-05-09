import 'package:flutter/material.dart';
import 'package:multirolbase/login_screen.dart';
import 'package:multirolbase/routes_place/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String email = '', age = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }

  load() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('email') ?? '';
    age = sp.getString('age') ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('welcome to home screen'),
            Row(
              children: [
                const Text('Email'),
                Text(email.toString()),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Text('age'),
                Text(age.toString()),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.clear();

                Navigator.pushNamed(context, RoutesNames.loginScreen);
              },
              child: Container(
                height: 60,
                width: double.infinity,
                color: Colors.greenAccent,
                child: const Center(
                    child: Text(
                  'logout',
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
