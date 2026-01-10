class TechnologyAdoptionModel {
  final String? id;
  final String? collegeId;
  final double? smartClassroomsPercentage;
  final List<String> eLearningPlatforms;

  TechnologyAdoptionModel({
    this.id,
    this.collegeId,
    this.smartClassroomsPercentage,
    this.eLearningPlatforms = const [],
  });

  factory TechnologyAdoptionModel.fromJson(Map<String, dynamic> json) {
    return TechnologyAdoptionModel(
      id: json['_id'] as String?,
      collegeId: json['collegeId'] as String?,
      smartClassroomsPercentage: (json['smartClassroomsPercentage'] as num?)?.toDouble(),
      eLearningPlatforms: (json['eLearningPlatforms'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList() ??
          const [],
    );
  }
}