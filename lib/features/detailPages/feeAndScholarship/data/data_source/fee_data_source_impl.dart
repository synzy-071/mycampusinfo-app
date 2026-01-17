import 'package:dartz/dartz.dart';
import 'package:mycampusinfo_app/core/network/endpoints.dart';
import 'package:mycampusinfo_app/core/network/exceptions.dart';
import 'package:mycampusinfo_app/core/network/network.dart';
import 'package:mycampusinfo_app/core/network/request.dart';
import 'package:mycampusinfo_app/core/network/typedef.dart';
import 'package:mycampusinfo_app/features/detailPages/feeAndScholarship/data/data_source/fee_data_source.dart';
import 'package:mycampusinfo_app/features/detailPages/feeAndScholarship/data/entities/fees_model.dart';

class FeesService implements AbstractFeesService {
  final NetworkService _networkService = NetworkService();

 @override
ResultFuture<List<ClassFeeModel>> getFeesByCollegeId({
  required String collegeId,
}) async {
  final endpoint = "${Endpoints.feesByCollege}/college/$collegeId";

  final request = Request(
    method: RequestMethod.get,
    endpoint: endpoint,
  );

  try {
    final result = await _networkService.request(request);

    final List list = result.data['data'];

    return Right(
      list.map((e) => ClassFeeModel.fromJson(e)).toList(),
    );
  } catch (e) {
    return Left(APIException.from(e));
  }
}
}