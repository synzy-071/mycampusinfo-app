import 'package:mycampusinfo_app/core/network/index.dart' show ResultFuture;
import 'package:mycampusinfo_app/features/detailPages/overview/data/entities/overview_model.dart';

abstract class PredictorDataSource {
  /// Predicts schools based on the provided filters
  /// Returns either an APIException or a list of predicted collegeModel objects
  ResultFuture<List<CollegeModel>?> predictColleges(
    Map<String, dynamic> filters,
  );
}
