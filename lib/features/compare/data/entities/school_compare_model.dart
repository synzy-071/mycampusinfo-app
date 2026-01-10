import 'package:freezed_annotation/freezed_annotation.dart';

part 'school_compare_model.freezed.dart';
part 'school_compare_model.g.dart';

@freezed
abstract class SchoolCompareModel with _$SchoolCompareModel {
  const factory SchoolCompareModel({
    required String name,
    required String feeRange,
    required String collegeMode,
    required List<String> shifts,
    required List<String> predefinedAmenities,
    required List<String> activities,
  }) = _SchoolCompareModel;

  factory SchoolCompareModel.fromJson(Map<String, dynamic> json) =>
      _$SchoolCompareModelFromJson(json);
}
