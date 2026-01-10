import 'package:dartz/dartz.dart';
import 'package:mycampusinfo_app/core/index.dart';
import 'package:mycampusinfo_app/features/compare/data/data_source/data_source.dart';
import 'package:mycampusinfo_app/features/compare/data/entities/school_compare_model.dart';

class CompareDataSourceImpl implements CompareDataSource {
  final NetworkService _networkService = NetworkService();

  @override
  ResultFuture<Map<String, SchoolCompareModel>?> compareSchools({
    required String collegeId1,
    required String collegeId2,
  }) async {
    final request = Request(
      method: RequestMethod.post,
      endpoint: Endpoints.adminCompare,
      body: {'schoolId1': collegeId1, 'schoolId2': collegeId2},
    );

    try {
      final result = await _networkService.request(request);
      final data = result.data['data'] as Map<String, dynamic>;
      if (data.isNotEmpty) {
        return Right({
          'school1': SchoolCompareModel.fromJson(
            data['school1'] as Map<String, dynamic>,
          ),
          'school2': SchoolCompareModel.fromJson(
            data['school2'] as Map<String, dynamic>,
          ),
        });
      }
    } catch (e) {
      return Left(APIException.from(e));
    }

    return Right(null);
  }
}
