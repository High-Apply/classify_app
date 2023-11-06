import 'package:classify_app/styles/custom_color_style.dart';
import 'package:classify_app/styles/custom_font_style.dart';
import 'package:classify_app/utils/get_week_number.dart';
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
            margin: const EdgeInsets.only(left: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 70,
                  child: Text(
                    "월",
                    style: weekNumber == 1
                        ? CustomTextStyle.subhead.copyWith(
                            fontWeight: FontWeight.bold,
                            color: CustomColor.lightGreen)
                        : CustomTextStyle.subhead,
                  ),
                ),
                SizedBox(
                  width: 70,
                  child: Text(
                    "화",
                    style: weekNumber == 2
                        ? CustomTextStyle.subhead.copyWith(
                            fontWeight: FontWeight.bold,
                            color: CustomColor.lightGreen)
                        : CustomTextStyle.subhead,
                  ),
                ),
                SizedBox(
                  width: 70,
                  child: Text(
                    "수",
                    style: weekNumber == 2
                        ? CustomTextStyle.subhead
                            .copyWith(fontWeight: FontWeight.bold)
                        : CustomTextStyle.subhead,
                  ),
                ),
                SizedBox(
                  width: 70,
                  child: Text(
                    "목",
                    style: weekNumber == 2
                        ? CustomTextStyle.subhead
                            .copyWith(fontWeight: FontWeight.bold)
                        : CustomTextStyle.subhead,
                  ),
                ),
                SizedBox(
                  width: 70,
                  child: Text(
                    "금",
                    style: weekNumber == 2
                        ? CustomTextStyle.subhead
                            .copyWith(fontWeight: FontWeight.bold)
                        : CustomTextStyle.subhead,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
