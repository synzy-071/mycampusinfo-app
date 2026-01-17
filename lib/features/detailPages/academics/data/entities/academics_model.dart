class CourseModel {
  final String? id;
  final String? collegeId;
  final String? courseName;
  final String? duration;
  final int? intake;
  final String? category;

  CourseModel({
    this.id,
    this.collegeId,
    this.courseName,
    this.duration,
    this.intake,
    this.category,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['_id'] as String?,
      collegeId: json['collegeId'] as String?,
      courseName: json['courseName'] as String?,
      duration: json['duration'] as String?,
      intake: json['intake'] as int?,
      category: json['category'] as String?,
    );
  }
}
