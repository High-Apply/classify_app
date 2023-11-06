import 'package:classify_app/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';

class HsCreditScreen extends StatelessWidget {
  const HsCreditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        title: '고교학점제',
      ),
      body: Center(child: Text("hscredit Screen")),
      backgroundColor: Colors.white,
    );
  }
}
