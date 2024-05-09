import 'package:flutter/material.dart';
import 'package:multirolbase/routes_place/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: RoutesNames.splashScreen,
      // onGenerateRoute: Routes.generateRoute,
    );
  }
}
