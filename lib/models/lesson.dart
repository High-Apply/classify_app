class Lesson {
  int? classId;
  String? className;
  String? classroom;
  int? weekday;
  int? classTime;
  String? teacherName;

  Lesson(
      {this.classId,
      this.className,
      this.classroom,
      this.weekday,
      this.classTime,
      this.teacherName});

  Lesson.fromJson(Map<String, dynamic> json) {
    classId = json['class_id'];
    className = json['class_name'];
    classroom = json['classroom'];
    weekday = json['weekday'];
    classTime = json['class_time'];
    teacherName = json['teacher_name'];
  }

  @override
  String toString() {
    return '{$className, $classTime, $classroom}';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['class_id'] = classId;
    data['class_name'] = className;
    data['classroom'] = classroom;
    data['weekday'] = weekday;
    data['class_time'] = classTime;
    data['teacher_name'] = teacherName;
    return data;
  }
}
