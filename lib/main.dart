import 'package:classify_app/screens/onboarding_screen.dart';
import 'package:classify_app/styles/custom_theme_data.dart';
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
      theme: lightThemeData(),
      darkTheme: darkThemeData(),
      themeMode: ThemeMode.light,
      home: const OnboardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
