class ClassFeeModel {
  final String courseName;
  final int tuition;
  final int activity;
  final int transport;
  final int hostel;
  final int misc;

  ClassFeeModel({
    required this.courseName,
    required this.tuition,
    required this.activity,
    required this.transport,
    required this.hostel,
    required this.misc,
  });

  factory ClassFeeModel.fromJson(Map<String, dynamic> json) {
    return ClassFeeModel(
      courseName: json['courseId']?['courseName'] ?? '',
      tuition: json['tuition'] ?? 0,
      activity: json['activity'] ?? 0,
      transport: json['transport'] ?? 0,
      hostel: json['hostel'] ?? 0,
      misc: json['misc'] ?? 0,
    );
  }
}
