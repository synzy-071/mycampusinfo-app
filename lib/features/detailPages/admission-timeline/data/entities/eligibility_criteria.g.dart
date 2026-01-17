// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eligibility_criteria.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EligibilityCriteria _$EligibilityCriteriaFromJson(Map<String, dynamic> json) =>
    _EligibilityCriteria(
      admissionLevel: json['admissionLevel'] as String?,
      ageCriteria: json['ageCriteria'] as String?,
      otherInfo: json['otherInfo'] as String?,
    );

Map<String, dynamic> _$EligibilityCriteriaToJson(
  _EligibilityCriteria instance,
) => <String, dynamic>{
  'admissionLevel': instance.admissionLevel,
  'ageCriteria': instance.ageCriteria,
  'otherInfo': instance.otherInfo,
};
