import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycampusinfo_app/common/index.dart';

part 'college_card_model.freezed.dart';
part 'college_card_model.g.dart';

@freezed
abstract class CollegeCardModel with _$CollegeCardModel {
  factory CollegeCardModel({
    String? collegeId,
    int? ratings,
    String? name,
    String? feeRange,
    String? area,
    String? location,
    Photo? coverImage,
    String? board,
    String? genderType,
    double? score,
    double? latitude,
    double? longitude,
    List<String>? shifts,
    List<String>? amenities,
    String? collegeMode,
  }) = _CollegeCardModel;

  factory CollegeCardModel.fromJson(Map<String, dynamic> json) =>
      _$CollegeCardModelFromJson(json);
}
