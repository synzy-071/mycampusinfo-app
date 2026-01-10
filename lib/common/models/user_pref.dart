import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_pref.freezed.dart';
part 'user_pref.g.dart';

@freezed
abstract class UserPref with _$UserPref {
  const factory UserPref({
  @JsonKey(name :" _id") String? sId,
    String? studentId,
    String? state,
    String? city,
    String? preferredStream,

    String? interests,
    String? collegeType,
    String? shift,
    String? createdAt,
    String? updatedAt,
    int? iV,
  }) = _UserPref;

  factory UserPref.fromJson(Map<String, dynamic> json) =>
      _$UserPrefFromJson(json);
}
