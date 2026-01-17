import 'package:freezed_annotation/freezed_annotation.dart';

import 'eligibility_criteria.dart';

part 'timeline.freezed.dart';
part 'timeline.g.dart';

@freezed
abstract class TimeLine with _$TimeLine {
  const factory TimeLine({
    DateTime? admissionStartDate,
    DateTime? admissionEndDate,
    String? status,
    List<String>? documentsRequired,
    EligibilityCriteria? eligibility,
    num? applicationFee,
    @JsonKey(name: '_id') String? sId,
  }) = _TimeLine;

  factory TimeLine.fromJson(Map<String, dynamic> json) =>
      _$TimeLineFromJson(json);
}
