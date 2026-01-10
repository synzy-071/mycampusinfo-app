import 'package:mycampusinfo_app/core/network/index.dart' show ResultFuture;
import 'package:mycampusinfo_app/features/detailPages/otherDetails/data/entities/otherDetails_model.dart';


abstract class AbstractOtherDetailsService {
  ResultFuture<OtherDetailsModel?> getOtherDetailsBycollegeId({
    required String collegeId,
  });
}