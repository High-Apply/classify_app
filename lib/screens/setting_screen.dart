import 'package:classify_app/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        title: '설정',
      ),
      body: Center(child: Text("setting Screen")),
      backgroundColor: Colors.white,
    );
  }
}
