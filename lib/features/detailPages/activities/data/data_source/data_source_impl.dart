import 'package:dartz/dartz.dart';
import 'package:mycampusinfo_app/core/network/index.dart'
    show
        NetworkService,
        ResultFuture,
        Request,
        RequestMethod,
        Endpoints,
        APIException;
import 'package:mycampusinfo_app/features/detailPages/activities/data/entities/activities_model.dart';


class ActivitiesService {
  final NetworkService _networkService = NetworkService();

  ResultFuture<ActivitiesModel?> addActivities({
    required String collegeId,
    required List<String> activities,
  }) async {
    Request r = Request(
      method: RequestMethod.post,
      endpoint: Endpoints.adminSchoolsActivities,
      body: {"collegeId": collegeId, "activities": activities},
    );

    try {
      final result = await _networkService.request(r);
      final response = result.data as Map<String, dynamic>;

      if (response.isNotEmpty) {
        final activities = ActivitiesModel.fromJson(response['data']);

        return Right(activities);
      }
    } catch (e) {
      return Left(APIException.from(e));
    }

    return Right(null);
  }

  ResultFuture<ActivitiesModel?> updateActivities({
    required String collegeId,
    required List<String> activities,
  }) async {
    Request r = Request(
      method: RequestMethod.put,
      endpoint: "${Endpoints.adminSchoolsActivities}/$collegeId",
      body: {"activities": activities},
    );

    try {
      final result = await _networkService.request(r);
      final response = result.data as Map<String, dynamic>;

      if (response.isNotEmpty) {
        final updatedActivities = ActivitiesModel.fromJson(response['data']);

        return Right(updatedActivities);
      }
    } catch (e) {
      return Left(APIException.from(e));
    }

    return Right(null);
  }

  ResultFuture<ActivitiesModel?> getActivitiesBycollegeId({
    required String collegeId,
  }) async {
    Request r = Request(
      method: RequestMethod.get,
      endpoint: "${Endpoints.adminSchoolsActivities}/$collegeId",
    );

    try {
      final result = await _networkService.request(r);
      final response = result.data as Map<String, dynamic>;

      if (response.isNotEmpty) {
        final getActivities = ActivitiesModel.fromJson(response['data']);
        return Right(getActivities);
      }
    } catch (e) {
      return Left(APIException.from(e));
    }

    return Right(null);
  }
}
