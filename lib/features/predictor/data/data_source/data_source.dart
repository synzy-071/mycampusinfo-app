import 'package:mycampusinfo_app/core/network/index.dart' show ResultFuture;
import 'package:mycampusinfo_app/features/detailPages/overview/data/entities/overview_model.dart';

abstract class PredictorDataSource {
  /// Predicts colleges using AI
  /// Returns either APIException or list of college names
  ResultFuture<List<String>?> predictColleges(
    Map<String, dynamic> filters,
  );
}

