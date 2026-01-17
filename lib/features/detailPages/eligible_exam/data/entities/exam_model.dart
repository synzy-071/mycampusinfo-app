class ExamModel {
  final String? id;
  final String? examName;
  final String? marksType;
  final double? minMarks;
  final double? maxMarks;

  ExamModel({
    this.id,
    this.examName,
    this.marksType,
    this.minMarks,
    this.maxMarks,
  });

  factory ExamModel.fromJson(Map<String, dynamic> json) {
    return ExamModel(
      id: json['_id'],
      examName: json['examName'],
      marksType: json['marksType'],
      minMarks: (json['minMarks'] as num?)?.toDouble(),
      maxMarks: (json['maxMarks'] as num?)?.toDouble(),
    );
  }
}
