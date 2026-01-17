import 'package:freezed_annotation/freezed_annotation.dart';

part 'eligibility_criteria.freezed.dart';
part 'eligibility_criteria.g.dart';

@freezed
abstract class EligibilityCriteria with _$EligibilityCriteria {
  const factory EligibilityCriteria({
    String? admissionLevel,
    String? ageCriteria,
    String? otherInfo,
  }) = _EligibilityCriteria;

  factory EligibilityCriteria.fromJson(Map<String, dynamic> json) =>
      _$EligibilityCriteriaFromJson(json);
}
