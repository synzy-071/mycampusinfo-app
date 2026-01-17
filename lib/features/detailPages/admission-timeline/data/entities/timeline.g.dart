// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimeLine _$TimeLineFromJson(Map<String, dynamic> json) => _TimeLine(
  admissionStartDate: json['admissionStartDate'] == null
      ? null
      : DateTime.parse(json['admissionStartDate'] as String),
  admissionEndDate: json['admissionEndDate'] == null
      ? null
      : DateTime.parse(json['admissionEndDate'] as String),
  status: json['status'] as String?,
  documentsRequired: (json['documentsRequired'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  eligibility: json['eligibility'] == null
      ? null
      : EligibilityCriteria.fromJson(
          json['eligibility'] as Map<String, dynamic>,
        ),
  applicationFee: json['applicationFee'] as num?,
  sId: json['_id'] as String?,
);

Map<String, dynamic> _$TimeLineToJson(_TimeLine instance) => <String, dynamic>{
  'admissionStartDate': instance.admissionStartDate?.toIso8601String(),
  'admissionEndDate': instance.admissionEndDate?.toIso8601String(),
  'status': instance.status,
  'documentsRequired': instance.documentsRequired,
  'eligibility': instance.eligibility,
  'applicationFee': instance.applicationFee,
  '_id': instance.sId,
};
