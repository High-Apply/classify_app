import 'dart:math';

import 'package:classify_app/models/lesson.dart';
import 'package:classify_app/services/get_all_class.dart';
import 'package:classify_app/styles/custom_color_style.dart';
import 'package:classify_app/styles/custom_font_style.dart';
import 'package:classify_app/styles/custom_timetable_theme.dart';
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
  final Future<List<Lesson>> _lessons = fetchTimetable(studentId: 34);


  _TTWeekScreenState() {
    var now = DateTime.now();
    week = DateFormat('EEEE').format(now);
    weekNumber = getWeekNumber(week);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 26,
            ),
            Row(
              children: [
                SizedBox(
                  width: (MediaQuery.of(context).size.width / 14),
                ),
                for (int i = 1; i <= dayOfWeeks.length; i++)
                  Padding(
                    padding: EdgeInsets.only(
                        right: (MediaQuery.of(context).size.width / 28)),
                    child: DayWeekSizedBox(weekNumber: weekNumber, idx: i),
                  ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            FutureBuilder<List<Lesson>>(
                future: _lessons,
                builder: (BuildContext context,
                    AsyncSnapshot<List<Lesson>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: CustomColor.midNight,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Error: ${snapshot.error}"),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text('No lessons available'),
                    );
                  } else {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const RenderWeeks(),
                        Column(
                          children: snapshot.data!.map((lesson) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: TimetableItem(
                                className: lesson.className!, classroom: lesson.classroom!,
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 28),
                        ),
                        Column(
                          children: snapshot.data!.map((lesson) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: TimetableItem(
                                className: lesson.className!, classroom: lesson.classroom!,
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 28),
                        ),
                        Column(
                          children: snapshot.data!.map((lesson) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: TimetableItem(
                                className: lesson.className!, classroom: lesson.classroom!,
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 28),
                        ),
                        Column(
                          children: snapshot.data!.map((lesson) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: TimetableItem(
                                className: lesson.className!, classroom: lesson.classroom!,
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 28),
                        ),
                        Column(
                          children: snapshot.data!.map((lesson) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: TimetableItem(
                                className: lesson.className!, classroom: lesson.classroom!,
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}

class RenderWeeks extends StatelessWidget {
  const RenderWeeks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> classTimes = ['1', '2', '3', '4', '5', '6', '7'];

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: classTimes.map((day) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: SizedBox(
            width: (MediaQuery.of(context).size.width / 14),
            height: 80,
            child: Center(child: Text(day, textAlign: TextAlign.center, style: const TextStyle(height: 1.0),)),
          )
        );
      }).toList(),
    );
  }
}

class TimetableItem extends StatelessWidget {
  final String className;
  final String classroom;
  final int? colorIdx;

  const TimetableItem({
    required this.className,
    required this.classroom,
    this.colorIdx,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TimetableColors timetableColors = TimetableColors();
    Color color;
    if (colorIdx != null) {
      color = timetableColors.lightColorMaps[colorIdx] ??
          Colors.black38; // Replace with your default color
    } else {
      final random = Random();
      color = timetableColors.lightColorMaps[random.nextInt(timetableColors.lightColorMaps.length)] ??
          Colors.black38; // Replace with your default color
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color
      ),
      width: (MediaQuery.of(context).size.width / 7),
      height: 80,
      padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(className, style: CustomTextStyle.captionLarge.copyWith(color: Colors.white),),
          Text(classroom, style: CustomTextStyle.captionMedium.copyWith(color: Colors.white.withOpacity(0.6)),),
        ],
      )
    );
  }
}
