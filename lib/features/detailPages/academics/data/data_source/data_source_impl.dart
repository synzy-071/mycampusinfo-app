import 'package:dartz/dartz.dart';
import 'package:mycampusinfo_app/core/network/index.dart';
import 'package:mycampusinfo_app/features/detailPages/academics/data/data_source/data_source.dart';
import 'package:mycampusinfo_app/features/detailPages/academics/data/entities/academics_model.dart';

class CoursesDataSourceImpl implements AbstractCoursesService {
  final NetworkService _networkService = NetworkService();

  @override
  ResultFuture<List<CourseModel>?> getCoursesBycollegeId({
    required String collegeId,
  }) async {

    final endpoint = "${Endpoints.coursesByCollege}/$collegeId";

    Request r = Request(method: RequestMethod.get, endpoint: endpoint);

    try {
      final result = await _networkService.request(r);
      final response = result.data as List<dynamic>;

      if (response.isNotEmpty) {
        final list = response.map((e) => CourseModel.fromJson(e)).toList();
        return Right(list);
      }
    } catch (e) {
      return Left(APIException.from(e));
    }
    return const Right(null);
  }
}
