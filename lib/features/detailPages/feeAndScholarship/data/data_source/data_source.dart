import 'package:mycampusinfo_app/features/detailPages/feeAndScholarship/data/entities/feeAndScholarship_model.dart';

import '../../../../../core/index.dart';

abstract class AbstractScholarshipService {
  ResultFuture<List<ScholarshipModel>> getScholarshipsByCollegeId({
    required String collegeId,
  });
}
