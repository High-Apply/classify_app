import 'package:classify_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Classify',
      theme: ThemeData(),
      home: const MyLoginScreen(title: "Classify Login"),
    );
  }
}
