class AmenitiesModel {
  String? collegeId;
  List<String>? predefinedAmenities;
  List<String>? customAmenities;
  String? createdAt;
  String? updatedAt;
  int? iV;

  AmenitiesModel({
    this.collegeId,
    this.predefinedAmenities,
    this.customAmenities,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  factory AmenitiesModel.fromJson(Map<String, dynamic> json) => AmenitiesModel(
        collegeId: json['collegeId'] as String?,
        predefinedAmenities: (json['predefinedAmenities'] as List?)
                ?.map((e) => e.toString())
                .toList() ??
            const [],
        customAmenities: (json['customAmenities'] as List?)
                ?.map((e) => e.toString())
                .toList() ??
            const [],
        createdAt: json['createdAt'] as String?,
        updatedAt: json['updatedAt'] as String?,
        iV: json['__v'] is int ? json['__v'] as int : int.tryParse('${json['__v'] ?? ''}'),
      );

  Map<String, dynamic> toJson() => {
        'collegeId': collegeId,
        'predefinedAmenities': predefinedAmenities ?? const [],
        'customAmenities': customAmenities ?? const [],
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': iV,
      };
}
