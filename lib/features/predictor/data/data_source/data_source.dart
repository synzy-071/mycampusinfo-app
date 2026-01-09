import 'package:dartz/dartz.dart';
import 'package:mycampusinfo_app/core/network/index.dart' show ResultFuture, APIException;
import 'package:mycampusinfo_app/features/detailPages/overview/data/entities/overview_model.dart';


abstract class PredictorDataSource {
  /// Predicts schools based on the provided filters
  /// Returns either an APIException or a list of predicted SchoolModel objects
  ResultFuture<List<SchoolModel>?> predictSchools(
    Map<String, dynamic> filters,
  );
}