class PlacementModel {
  final String? id;
  final String? collegeId;
  final int? year;
  final int? totalStudents;
  final int? placedStudents;
  final double? highestPackage;
  final double? averagePackage;
  final List<String> topRecruiters;

  PlacementModel({
    this.id,
    this.collegeId,
    this.year,
    this.totalStudents,
    this.placedStudents,
    this.highestPackage,
    this.averagePackage,
    this.topRecruiters = const [],
  });

  factory PlacementModel.fromJson(Map<String, dynamic> json) {
    return PlacementModel(
      id: json['_id'],
      collegeId: json['collegeId'],
      year: json['year'],
      totalStudents: json['totalStudents'],
      placedStudents: json['placedStudents'],
      highestPackage: (json['highestPackage'] as num?)?.toDouble(),
      averagePackage: (json['averagePackage'] as num?)?.toDouble(),
      topRecruiters: (json['topRecruiters'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
    );
  }
}
