import 'package:classify_app/styles/custom_font_style.dart';
import 'package:flutter/material.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({super.key});

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leadingWidth: 16,
          leading: Container(),
          title: const Text(
            '주간 시간표',
            style: CustomTextStyle.displayLarge,
          ),
          bottom: const TabBar(tabs: [
            Tab(
              child: Text(
                "Week",
                style: CustomTextStyle.titleSmall,
              ),
            ),
            Tab(
              child: Text(
                "Day",
                style: CustomTextStyle.titleSmall,
              ),
            ),
            Tab(
              child: Text(
                "Lunch",
                style: CustomTextStyle.titleSmall,
              ),
            ),
          ]),
        ),
        body: const TabBarView(children: [
          Center(
            child: Text("IT IS ANDROID"),
          ),
          Center(
            child: Text("IT IS MAC"),
          ),
          Center(
            child: Text("IT IS RESTAURANT"),
          ),
        ]),
        backgroundColor: Colors.white,
      ),
    );
  }
}
