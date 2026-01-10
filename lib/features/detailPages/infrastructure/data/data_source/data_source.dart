import 'package:dartz/dartz.dart';
import 'package:mycampusinfo_app/core/network/index.dart' show ResultFuture;
import '../entities/infrastructure_model.dart';

abstract class AbstractInfrastructureService {
  ResultFuture<InfrastructureModel?> getInfrastructureBycollegeId({
    required String collegeId,
  });

  ResultFuture<InfrastructureModel?> addInfrastructure({
    required String collegeId,
    required List<String> labs,
    required List<String> sportsGrounds,
    required int libraryBooks,
    required int smartClassrooms,
  });

  ResultFuture<InfrastructureModel?> updateInfrastructure({
    required String collegeId,
    List<String>? labs,
    List<String>? sportsGrounds,
    int? libraryBooks,
    int? smartClassrooms,
  });
}