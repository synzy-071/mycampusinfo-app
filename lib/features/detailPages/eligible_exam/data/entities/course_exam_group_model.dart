// features/detailPages/exam/data/entities/course_exam.dart
class CourseExam {
  final String id;
  final String courseId;
  final String courseName;
  final String examName;
  final String marksType;
  final int minMarks;
  final int maxMarks;

  CourseExam({
    required this.id,
    required this.courseId,
    required this.courseName,
    required this.examName,
    required this.marksType,
    required this.minMarks,
    required this.maxMarks,
  });

  factory CourseExam.fromJson(Map<String, dynamic> json) {
    return CourseExam(
      id: json['_id'],
      courseId: json['courseId'],
      courseName: json['courseName'] ?? '',
      examName: json['examName'],
      marksType: json['marksType'],
      minMarks: json['minMarks'],
      maxMarks: json['maxMarks'],
    );
  }
}
