import 'package:classify_app/styles/custom_font_style.dart';
import 'package:flutter/material.dart';

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
        style:
            idx == 0 ? CustomTextStyle.titleSmall : CustomTextStyle.titleSmall,
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
        style:
            idx == 1 ? CustomTextStyle.titleSmall : CustomTextStyle.titleSmall,
      ),
    );
  }
}

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
        style:
            idx == 2 ? CustomTextStyle.titleSmall : CustomTextStyle.titleSmall,
      ),
    );
  }
}
