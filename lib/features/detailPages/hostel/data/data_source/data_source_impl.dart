// features/detailPages/hostel/data/data_source/hostel_datasource_impl.dart

import 'package:dartz/dartz.dart';
import 'package:mycampusinfo_app/core/network/index.dart';
import '../entities/hostel_model.dart';
import 'data_source.dart';

class HostelDataSourceImpl implements HostelDataSource {
  final NetworkService _networkService = NetworkService();

  @override
  ResultFuture<List<HostelModel>> getHostelsByCollegeId({
    required String collegeId,
  }) async {
    // Define endpoint
    final endpoint = "${Endpoints.collegeHostels}/$collegeId";

    Request request = Request(
      method: RequestMethod.get,
      endpoint: endpoint,
    );

    try {
      final result = await _networkService.request(request);

      final response = result.data as Map<String, dynamic>;

      if (response['data'] != null && response['data'] is List) {
        final List<HostelModel> hostels =
            (response['data'] as List)
                .map((e) => HostelModel.fromJson(e))
                .toList();

        return Right(hostels);
      }

      return const Right([]);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }
}
