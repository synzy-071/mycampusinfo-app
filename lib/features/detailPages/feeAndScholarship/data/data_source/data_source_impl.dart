import 'package:dartz/dartz.dart';
import 'package:mycampusinfo_app/features/detailPages/feeAndScholarship/data/data_source/data_source.dart';
import 'package:mycampusinfo_app/features/detailPages/feeAndScholarship/data/entities/feeAndScholarship_model.dart';

import '../../../../../core/index.dart';

class ScholarshipService implements AbstractScholarshipService {
  final NetworkService _networkService = NetworkService();

  @override
  ResultFuture<List<ScholarshipModel>> getScholarshipsByCollegeId({
    required String collegeId,
  }) async {
    final endpoint =
        "${Endpoints.scholarshipsByCollege}/$collegeId";

    final request =
        Request(method: RequestMethod.get, endpoint: endpoint);

    try {
      final result = await _networkService.request(request);
      final list = (result.data as List)
          .map((e) => ScholarshipModel.fromJson(e))
          .toList();
      return Right(list);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }
}
