import 'package:mycampusinfo_app/core/network/index.dart' show ResultFuture;
import 'package:mycampusinfo_app/features/detailPages/admission-timeline/data/entities/admission-model.dart';

abstract class AbstractAdmissionTimelineService {
  ResultFuture<AdmissionTimeline?> getAdmissionTimelineBycollegeId({
    required String collegeId,
  });
}
