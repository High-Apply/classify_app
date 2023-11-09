import 'package:classify_app/styles/custom_font_style.dart';
import 'package:flutter/material.dart';

Map<int, String> dayOfWeeks = {
  0: '월',
  1: '화',
  2: '수',
  3: '목',
  4: '금',
};

class DayWeekSizedBox extends StatelessWidget {
  const DayWeekSizedBox(
      {super.key, required this.weekNumber, required this.idx});

  final int weekNumber;
  final int idx;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        dayOfWeeks[idx - 1]!,
        style: weekNumber == idx
            ? CustomTextStyle.subhead
                .copyWith(fontWeight: FontWeight.bold, color: Colors.black)
            : null,
      ),
    );
  }
}