import 'package:classify_app/styles/custom_font_style.dart';
import 'package:flutter/material.dart';

class Tab3 extends StatelessWidget {
  const Tab3(
      {super.key, required TabController tabController, required this.idx})
      : _tabController = tabController;

  final TabController _tabController;
  final int idx;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        "Lunch",
        style: _tabController.index == 2
            ? CustomTextStyle.titleSmall.copyWith(fontWeight: FontWeight.bold)
            : CustomTextStyle.titleSmall,
      ),
    );
  }
}

class Tab2 extends StatelessWidget {
  const Tab2(
      {super.key, required TabController tabController, required this.idx})
      : _tabController = tabController;

  final TabController _tabController;
  final int idx;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        "Day",
        style: _tabController.index == 1
            ? CustomTextStyle.titleSmall.copyWith(fontWeight: FontWeight.bold)
            : CustomTextStyle.titleSmall,
      ),
    );
  }
}

class Tab1 extends StatelessWidget {
  const Tab1(
      {super.key, required TabController tabController, required this.idx})
      : _tabController = tabController;

  final TabController _tabController;
  final int idx;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        'Week',
        style: _tabController.index == 0
            ? CustomTextStyle.titleSmall.copyWith(fontWeight: FontWeight.bold)
            : CustomTextStyle.titleSmall,
      ),
    );
  }
}
