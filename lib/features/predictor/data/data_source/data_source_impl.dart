import 'package:dartz/dartz.dart';
import 'package:mycampusinfo_app/common/index.dart';
import 'package:mycampusinfo_app/core/network/endpoints.dart';
import 'package:mycampusinfo_app/core/network/exceptions.dart';
import 'package:mycampusinfo_app/core/network/network.dart';
import 'package:mycampusinfo_app/core/network/request.dart';
import 'package:mycampusinfo_app/core/network/typedef.dart';

class PredictorDataSourceImpl {
  final NetworkService _networkService = NetworkService();

  ResultFuture<List<String>?> predictColleges(
    Map<String, dynamic> filters,
  ) async {
    Request r = Request(
      method: RequestMethod.post,
      endpoint: Endpoints.collegesPredictColleges,
      body: filters,
    );

    try {
      final result = await _networkService.request(r);
      final response = result.data as Map<String, dynamic>;

      if (response.isNotEmpty) {
        final List<dynamic> names = response['data'];
        return Right(names.cast<String>());
      }
    } catch (e) {
      return Left(APIException.from(e));
    }

    return Right(null);
  }
}
