import 'package:classify_app/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        title: '공유 캘린더',
      ),
      body: Center(child: Text("calendar Screen")),
      backgroundColor: Colors.white,
    );
  }
}
