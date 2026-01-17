import 'package:freezed_annotation/freezed_annotation.dart';

import 'timeline.dart';

part 'admission-model.freezed.dart';
part 'admission-model.g.dart';

@freezed
abstract class AdmissionTimeline with _$AdmissionTimeline {
  const factory AdmissionTimeline({
    String? id,
    String? collegeId,
    List<TimeLine>? timelines,
  }) = _AdmissionTimeline;

  factory AdmissionTimeline.fromJson(Map<String, dynamic> json) =>
      _$AdmissionTimelineFromJson(json);
}
