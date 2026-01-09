import 'package:mycampusinfo_app/core/network/index.dart' show ResultFuture;
import 'package:mycampusinfo_app/features/detailPages/internationalExposure/data/entities/international-model.dart';


abstract class AbstractInternationalExposureService {
  ResultFuture<InternationalExposureModel?> getInternationalExposureBySchoolId({
    required String schoolId,
  });
}