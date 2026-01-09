import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycampusinfo_app/common/utils/convertors.dart';
import 'package:mycampusinfo_app/core/index.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    String? authId,
    String? email,
    String? contactNo,
    String? dateOfBirth,
    String? name,
    String? gender,
    String? state,
    String? city,
    String? area,
       double? latitude,
    double? longitude,
    
    List<String>? shortlistedSchools,
    @UserTypeConverter() UserType? userType,
    @JsonKey(name: '_id') String? sId,
    String? createdAt,
    String? updatedAt,
    @JsonKey(name: '__v') int? iV,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
