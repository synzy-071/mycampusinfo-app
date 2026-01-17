import 'package:mycampusinfo_app/core/network/index.dart';
import 'package:mycampusinfo_app/features/detailPages/placement/data/entities/course_placement.dart';

abstract class AbstractPlacementService {
  ResultFuture<List<CoursePlacementGroup>?> getPlacementsBycollegeId({
    required String collegeId,
  });
}
