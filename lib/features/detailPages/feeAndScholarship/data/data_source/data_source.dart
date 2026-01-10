
import 'package:mycampusinfo_app/core/network/typedef.dart';
import 'package:mycampusinfo_app/features/detailPages/feeAndScholarship/data/entities/feeAndScholarship_model.dart';

abstract class AbstractFeesAndScholarshipsService {
  ResultFuture<FeesAndScholarshipsModel?> getFeesAndScholarshipsBycollegeId({
    required String collegeId,
  });
}