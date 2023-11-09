import 'package:classify_app/utils/get_week_number.dart';
import 'package:classify_app/widgets/sizedbox/day_week_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TTWeekScreen extends StatefulWidget {
  const TTWeekScreen({super.key});

  @override
  State<TTWeekScreen> createState() => _TTWeekScreenState();
}

class _TTWeekScreenState extends State<TTWeekScreen> {
  late String week;
  late int weekNumber;
  _TTWeekScreenState() {
    var now = DateTime.now();
    week = DateFormat('EEEE').format(now);
    weekNumber = getWeekNumber(week);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 26,
          ),
          Container(
            margin: const EdgeInsets.only(left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (int i = 1; i <= dayOfWeeks.length; i++)
                  DayWeekSizedBox(weekNumber: weekNumber, idx: i)
              ],
            ),
          )
        ],
      ),
    );
  }
}
