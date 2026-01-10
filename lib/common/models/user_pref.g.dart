// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_pref.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserPref _$UserPrefFromJson(Map<String, dynamic> json) => _UserPref(
  sId: json[' _id'] as String?,
  studentId: json['studentId'] as String?,
  state: json['state'] as String?,
  city: json['city'] as String?,
  preferredStream: json['preferredStream'] as String?,
  interests: json['interests'] as String?,
  collegeType: json['collegeType'] as String?,
  shift: json['shift'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  iV: (json['iV'] as num?)?.toInt(),
);

Map<String, dynamic> _$UserPrefToJson(_UserPref instance) => <String, dynamic>{
  ' _id': instance.sId,
  'studentId': instance.studentId,
  'state': instance.state,
  'city': instance.city,
  'preferredStream': instance.preferredStream,
  'interests': instance.interests,
  'collegeType': instance.collegeType,
  'shift': instance.shift,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'iV': instance.iV,
};
