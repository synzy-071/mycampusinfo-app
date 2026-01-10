import 'package:mycampusinfo_app/core/network/index.dart';
import '../entities/placement_model.dart';

abstract class AbstractPlacementService {
  ResultFuture<List<PlacementModel>?> getPlacementsBycollegeId({
    required String collegeId,
  });
}
