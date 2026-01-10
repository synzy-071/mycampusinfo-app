// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'college_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CollegeCardModel _$CollegeCardModelFromJson(Map<String, dynamic> json) =>
    _CollegeCardModel(
      collegeId: json['collegeId'] as String?,
      ratings: (json['ratings'] as num?)?.toInt(),
      name: json['name'] as String?,
      feeRange: json['feeRange'] as String?,
      area: json['area'] as String?,
      location: json['location'] as String?,
      coverImage: json['coverImage'] == null
          ? null
          : Photo.fromJson(json['coverImage'] as Map<String, dynamic>),
      board: json['board'] as String?,
      genderType: json['genderType'] as String?,
      score: (json['score'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      shifts: (json['shifts'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      amenities: (json['amenities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      collegeMode: json['collegeMode'] as String?,
    );

Map<String, dynamic> _$CollegeCardModelToJson(_CollegeCardModel instance) =>
    <String, dynamic>{
      'collegeId': instance.collegeId,
      'ratings': instance.ratings,
      'name': instance.name,
      'feeRange': instance.feeRange,
      'area': instance.area,
      'location': instance.location,
      'coverImage': instance.coverImage,
      'board': instance.board,
      'genderType': instance.genderType,
      'score': instance.score,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'shifts': instance.shifts,
      'amenities': instance.amenities,
      'collegeMode': instance.collegeMode,
    };
