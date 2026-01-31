import 'package:mycampusinfo_app/features/detailPages/overview/data/entities/overview_model.dart';

class CollegeDetailsData {
  final CollegeModel college;
  final int courseCount;
  final List<String> allExams;
  final int highestPackage;
  final List<String> topCompanies;

  CollegeDetailsData({
    required this.college,
    required this.courseCount,
    required this.allExams,
    required this.highestPackage,
    required this.topCompanies,
  });

  factory CollegeDetailsData.fromJson(Map<String, dynamic> json) {
    return CollegeDetailsData(
      college: CollegeModel.fromJson(json['college']),
      courseCount: json['courseCount'] ?? 0,
      allExams: List<String>.from(json['allExams'] ?? []),
      highestPackage: json['highestPackage'] ?? 0,
      topCompanies: List<String>.from(json['topCompanies'] ?? []),
    );
  }
}
