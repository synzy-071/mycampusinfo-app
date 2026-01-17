import 'package:mycampusinfo_app/features/detailPages/placement/data/entities/placement_model.dart';

class CoursePlacementGroup {
  final String courseId;
  final String courseName;
  final List<PlacementModel> placements;

  CoursePlacementGroup({
    required this.courseId,
    required this.courseName,
    required this.placements,
  });

  factory CoursePlacementGroup.fromJson(Map<String, dynamic> json) {
    return CoursePlacementGroup(
      courseId: json['courseId'],
      courseName: json['courseName'],
      placements: (json['placements'] as List)
          .map((e) => PlacementModel.fromJson(e))
          .toList(),
    );
  }
}
