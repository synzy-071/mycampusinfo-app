// features/detailPages/exam/data/data_source.dart
import 'package:mycampusinfo_app/core/network/typedef.dart';
import 'package:mycampusinfo_app/features/detailPages/eligible_exam/data/entities/course_exam_group_model.dart';


abstract class AbstractExamService {
  ResultFuture<List<CourseExam>?> getExamsByCollegeId({
    required String collegeId,
  });
}
