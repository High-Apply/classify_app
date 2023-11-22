import 'dart:convert';

import 'package:classify_app/models/lesson.dart';
import 'package:http/http.dart' as http;

Future<List<Lesson>> fetchTimetable({required int studentId}) async {
  try {
    final url = Uri.http('18.234.158.113:8080', '/class/$studentId');
    final res = await http.get(url);
    if (res.statusCode == 200) {
      List<dynamic> data = json.decode(utf8.decode(res.bodyBytes));
      final List<Lesson> result =
          data.map((lesson) => Lesson.fromJson(lesson)).toList();
      return result;
    } else {
      throw Exception('Failed to Load Data');
    }
  } catch (e) {
    throw Exception(e);
  }
}
