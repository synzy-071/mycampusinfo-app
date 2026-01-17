// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admission-model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdmissionTimeline _$AdmissionTimelineFromJson(Map<String, dynamic> json) =>
    _AdmissionTimeline(
      id: json['id'] as String?,
      collegeId: json['collegeId'] as String?,
      timelines: (json['timelines'] as List<dynamic>?)
          ?.map((e) => TimeLine.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AdmissionTimelineToJson(_AdmissionTimeline instance) =>
    <String, dynamic>{
      'id': instance.id,
      'collegeId': instance.collegeId,
      'timelines': instance.timelines,
    };
