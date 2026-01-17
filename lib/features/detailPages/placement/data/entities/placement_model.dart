class PlacementModel {
  final String id;
  final int year;
  final int? minPackage;
  final int? maxPackage;
  final int? averagePackage;
  final int? totalStudents;
  final int? placedStudents;
  final List<String> companies;

  PlacementModel({
    required this.id,
    required this.year,
    this.minPackage,
    this.maxPackage,
    this.averagePackage,
    this.totalStudents,
    this.placedStudents,
    required this.companies,
  });

  factory PlacementModel.fromJson(Map<String, dynamic> json) {
    return PlacementModel(
      id: json['_id'],
      year: json['year'],
      minPackage: json['minPackage'],
      maxPackage: json['maxPackage'],
      averagePackage: json['averagePackage'],
      totalStudents: json['totalStudents'],
      placedStudents: json['placedStudents'],
      companies: List<String>.from(json['companies'] ?? []),
    );
  }
}
