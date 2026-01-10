
import 'package:mycampusinfo_app/core/network/index.dart' show ResultFuture;
import 'package:mycampusinfo_app/features/detailPages/activities/data/entities/activities_model.dart';

abstract class AbstractActivitiesService {
  ResultFuture<ActivitiesModel?> addActivities({
    required String collegeId,
    required List<String> activities,
  });

  ResultFuture<ActivitiesModel?> updateActivities({
    required String collegeId,
    required List<String> activities,
  });

  ResultFuture<ActivitiesModel?> getActivitiesBycollegeId({
    required String collegeId,
  });
}