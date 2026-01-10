import 'package:mycampusinfo_app/core/network/index.dart' show ResultFuture;
import 'package:mycampusinfo_app/features/detailPages/faculty/data/entities/faculty-model.dart';


abstract class AbstractFacultyService {
  ResultFuture<FacultyModel?> getFacultyBycollegeId({
    required String collegeId,
  });
}