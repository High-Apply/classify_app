import 'package:classify_app/screens/timetable/tt_day_screen.dart';
import 'package:classify_app/screens/timetable/tt_lunch_screen.dart';
import 'package:classify_app/screens/timetable/tt_week_screen.dart';
import 'package:classify_app/widgets/tabbar/tabs.dart';
import 'package:flutter/material.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({super.key});

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  var _activeTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: AppBar(
          elevation: 0,
          leadingWidth: 16,
          leading: Container(),
          title: const Text(
            '주간 시간표',
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: SizedBox(
              width: 350,
              child: TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.black,
                  controller: _tabController,
                  onTap: (idx) {
                    _activeTabIndex = idx;
                  },
                  tabs: [
                    Tab1(
                      tabController: _tabController,
                      idx: _activeTabIndex,
                    ),
                    Tab2(
                      tabController: _tabController,
                      idx: _activeTabIndex,
                    ),
                    Tab3(
                      tabController: _tabController,
                      idx: _activeTabIndex,
                    ),
                  ]),
            ),
          ),
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          children: const [TTWeekScreen(), TTDayScreen(), TTLunchScreen()]),
    );
  }
}
