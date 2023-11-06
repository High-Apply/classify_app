import 'package:flutter/material.dart';

class TTLunchScreen extends StatefulWidget {
  const TTLunchScreen({super.key});

  @override
  State<TTLunchScreen> createState() => _TTLunchScreenState();
}

class _TTLunchScreenState extends State<TTLunchScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("LUNCH SCREEN")),
    );
  }
}
