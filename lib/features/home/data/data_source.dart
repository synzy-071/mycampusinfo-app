import 'package:mycampusinfo_app/common/index.dart';
import 'package:mycampusinfo_app/core/index.dart';

abstract class SchoolDataSource {
  ResultFuture<List<SchoolCardModel>> getSchools({
    Map<String, dynamic> filters,
  });

  ResultFuture<List<SchoolCardModel>> getNearbySchools({
    required double latitude,
    required double longitude,
    required String state,
  });
}