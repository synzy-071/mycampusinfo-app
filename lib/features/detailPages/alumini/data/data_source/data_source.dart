
import 'package:mycampusinfo_app/core/network/typedef.dart';
import 'package:mycampusinfo_app/features/detailPages/alumini/data/entities/alumini_model.dart';

abstract class AbstractAlumniService {
  ResultFuture<AlumniModel?> addAlumni({
    required String collegeId,
    required List<AlumniScoreItem> topAlumnis,
    required List<FamousAlumniItem> famousAlumnies,
    required List<AlumniScoreItem> alumnis,
  });

  ResultFuture<AlumniModel?> getAlumniBySchool({required String collegeId});

  ResultFuture<AlumniModel?> updateAlumniBySchool({
    required String collegeId,
    List<AlumniScoreItem>? topAlumnis,
    List<FamousAlumniItem>? famousAlumnies,
    List<AlumniScoreItem>? alumnis,
  });

  ResultFuture<String?> deleteAlumniBySchool({required String collegeId});
}
