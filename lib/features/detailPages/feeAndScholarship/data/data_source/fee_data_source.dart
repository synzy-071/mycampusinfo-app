import 'package:mycampusinfo_app/core/network/typedef.dart';
import 'package:mycampusinfo_app/features/detailPages/feeAndScholarship/data/entities/fees_model.dart';

abstract class AbstractFeesService {
  ResultFuture<List<ClassFeeModel>> getFeesByCollegeId({
    required String collegeId,
  });
}
