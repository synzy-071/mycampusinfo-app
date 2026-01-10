// features/compare/data/data_source/data_source.dart
import 'package:mycampusinfo_app/core/network/typedef.dart';

import '../entities/school_compare_model.dart' show SchoolCompareModel;

abstract class CompareDataSource {
  ResultFuture<Map<String, SchoolCompareModel>?> compareSchools({
    required String collegeId1,
    required String collegeId2,
  });
}
