import 'package:mycampusinfo_app/core/network/index.dart';
import 'package:mycampusinfo_app/features/detailPages/academics/data/entities/academics_model.dart';

abstract class AbstractCoursesService {
  ResultFuture<List<CourseModel>?> getCoursesBycollegeId({
    required String collegeId,
  });
}
