import 'package:dartz/dartz.dart';
import 'package:mycampusinfo_app/core/network/index.dart';
import 'package:mycampusinfo_app/features/detailPages/placement/data/data_source/data_source.dart';
import '../entities/placement_model.dart';

class PlacementDataSourceImpl implements AbstractPlacementService {
  final NetworkService _networkService = NetworkService();

  @override
  ResultFuture<List<PlacementModel>?> getPlacementsBycollegeId({
    required String collegeId,
  }) async {
    final endpoint = "${Endpoints.placementsByCollege}/$collegeId";
    Request r = Request(method: RequestMethod.get, endpoint: endpoint);

    try {
      final result = await _networkService.request(r);
      final List<dynamic> response = result.data;

      if (response.isNotEmpty) {
        final list = response.map((e) => PlacementModel.fromJson(e)).toList();
        return Right(list);
      }
    } catch (e) {
      return Left(APIException.from(e));
    }
    return const Right(null);
  }
}
