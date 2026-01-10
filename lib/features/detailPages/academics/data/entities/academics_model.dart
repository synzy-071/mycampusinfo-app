class CourseModel {
  final String? id;
  final String? collegeId;
  final String? courseName;
  final String? duration;
  final double? fees;
  final String? examType;
  final String? category;
  final String? rankType;
  final double? maxRankOrPercentile;

  CourseModel({
    this.id,
    this.collegeId,
    this.courseName,
    this.duration,
    this.fees,
    this.examType,
    this.category,
    this.rankType,
    this.maxRankOrPercentile,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['_id'] as String?,
      collegeId: json['collegeId'] as String?,
      courseName: json['courseName'] as String?,
      duration: json['duration'] as String?,
      fees: (json['fees'] as num?)?.toDouble(),
      examType: json['examType'] as String?,
      category: json['category'] as String?,
      rankType: json['rankType'] as String?,
      maxRankOrPercentile: (json['maxRankOrPercentile'] as num?)?.toDouble(),
    );
  }
}
