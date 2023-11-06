import 'package:classify_app/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({super.key});

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        title: '주간 시간표',
      ),
      body: Center(child: Text("timetable Screen")),
      backgroundColor: Colors.white,
    );
  }
}
