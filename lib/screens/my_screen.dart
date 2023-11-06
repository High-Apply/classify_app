import 'package:classify_app/screens/calendar_screen.dart';
import 'package:classify_app/screens/hscredit_screen.dart';
import 'package:classify_app/screens/setting_screen.dart';
import 'package:classify_app/screens/timetable_screen.dart';
import 'package:classify_app/styles/custom_color_style.dart';
import 'package:flutter/material.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  int _selctedIndex = 0;
  final List<Widget> _widgetOptions = [
    const TimetableScreen(),
    const CalendarScreen(),
    const HsCreditScreen(),
    const SettingScreen()
  ];

  void _onItemTapped(int idx) {
    setState(() {
      _selctedIndex = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _widgetOptions.elementAt(_selctedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.table_chart), label: "시간표"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: "일정"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "고교학점제"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "설정"),
        ],
        currentIndex: _selctedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        elevation: 0,
        unselectedItemColor: CustomColor.subtext,
        selectedItemColor: CustomColor.lightGreen,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
