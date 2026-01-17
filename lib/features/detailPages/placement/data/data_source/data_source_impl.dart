import 'package:dartz/dartz.dart';
import 'package:mycampusinfo_app/core/network/index.dart';
import 'package:mycampusinfo_app/features/detailPages/placement/data/entities/course_placement.dart';
import 'data_source.dart';

class PlacementDataSourceImpl implements AbstractPlacementService {
  final NetworkService _networkService = NetworkService();

  @override
  ResultFuture<List<CoursePlacementGroup>?> getPlacementsBycollegeId({
    required String collegeId,
  }) async {
    final endpoint = "${Endpoints.placementsByCollege}/$collegeId";
    Request r = Request(method: RequestMethod.get, endpoint: endpoint);

    try {
      final result = await _networkService.request(r);
      final List<dynamic> response = result.data;

      final list = response
          .map((e) => CoursePlacementGroup.fromJson(e))
          .toList();

      return Right(list);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }
}
