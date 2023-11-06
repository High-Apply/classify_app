import 'package:flutter/material.dart';

class TTDayScreen extends StatefulWidget {
  const TTDayScreen({super.key});

  @override
  State<TTDayScreen> createState() => _TTDayScreenState();
}

class _TTDayScreenState extends State<TTDayScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("DAY SCREEN"),
      ),
    );
  }
}
