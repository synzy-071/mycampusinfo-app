// features/detailPages/exam/data/exam_datasource_impl.dart
import 'package:dartz/dartz.dart';
import 'package:mycampusinfo_app/core/network/index.dart';
import 'package:mycampusinfo_app/features/detailPages/eligible_exam/data/entities/course_exam_group_model.dart';
import 'data_source.dart';

class ExamDataSourceImpl implements AbstractExamService {
  final NetworkService _networkService = NetworkService();

  @override
  ResultFuture<List<CourseExam>?> getExamsByCollegeId({
    required String collegeId,
  }) async {
    final endpoint = "${Endpoints.examsByCollege}/$collegeId";

    final request = Request(
      method: RequestMethod.get,
      endpoint: endpoint,
    );

    try {
      final result = await _networkService.request(request);

      final List<dynamic> response = result.data;

      final exams =
          response.map((e) => CourseExam.fromJson(e)).toList();

      return Right(exams);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }
}
