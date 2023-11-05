import 'package:flutter/material.dart';

class MyLoginScreen extends StatefulWidget {
  const MyLoginScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyLoginScreen> createState() => _MyLoginScreenState();
}

class _MyLoginScreenState extends State<MyLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(child: Text(widget.title)),
    );
  }
}
