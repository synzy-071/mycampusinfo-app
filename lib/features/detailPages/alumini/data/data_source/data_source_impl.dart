import 'package:dartz/dartz.dart';
import 'package:mycampusinfo_app/core/network/endpoints.dart';
import 'package:mycampusinfo_app/core/network/exceptions.dart';
import 'package:mycampusinfo_app/core/network/network.dart';
import 'package:mycampusinfo_app/core/network/request.dart';
import 'package:mycampusinfo_app/core/network/typedef.dart';
import 'package:mycampusinfo_app/features/detailPages/alumini/data/data_source/data_source.dart';
import 'package:mycampusinfo_app/features/detailPages/alumini/data/entities/alumini_model.dart';

class AlumniDataSourceImpl implements AbstractAlumniService {
  final NetworkService _network = NetworkService();

  @override
  ResultFuture<AlumniModel?> addAlumni({
    required String collegeId,
    required List<AlumniScoreItem> topAlumnis,
    required List<FamousAlumniItem> famousAlumnies,
    required List<AlumniScoreItem> alumnis,
  }) async {
    final body = {
      'collegeId': collegeId,
      'topAlumnis': topAlumnis.map((e) => e.toJson()).toList(),
      'famousAlumnies': famousAlumnies.map((e) => e.toJson()).toList(),
      'alumnis': alumnis.map((e) => e.toJson()).toList(),
    };

    final req = Request(
      method: RequestMethod.post,
      endpoint: Endpoints.adminSchoolsAlumnus, // "/alumnus"
      body: body,
    );

    try {
      final result = await _network.request(req);
      final response = result.data as Map<String, dynamic>;
      if (response.isNotEmpty && response['data'] != null) {
        return Right(AlumniModel.fromJson(response['data'] as Map<String, dynamic>));
      }
    } catch (e) {
      return Left(APIException.from(e));
    }
    return Right(null);
  }

  @override
  ResultFuture<AlumniModel?> getAlumniBySchool({required String collegeId}) async {
    final req = Request(
      method: RequestMethod.get,
      endpoint: "${Endpoints.adminSchoolsAlumnus}/$collegeId",
    );

    try {
      final result = await _network.request(req);
      final response = result.data as Map<String, dynamic>;
      if (response.isNotEmpty && response['data'] != null) {
        return Right(AlumniModel.fromJson(response['data'] as Map<String, dynamic>));
      }
    } catch (e) {
      return Left(APIException.from(e));
    }
    return Right(null);
  }

  @override
  ResultFuture<AlumniModel?> updateAlumniBySchool({
    required String collegeId,
    List<AlumniScoreItem>? topAlumnis,
    List<FamousAlumniItem>? famousAlumnies,
    List<AlumniScoreItem>? alumnis,
  }) async {
    final body = <String, dynamic>{};
    if (topAlumnis != null) body['topAlumnis'] = topAlumnis.map((e) => e.toJson()).toList();
    if (famousAlumnies != null) body['famousAlumnies'] = famousAlumnies.map((e) => e.toJson()).toList();
    if (alumnis != null) body['alumnis'] = alumnis.map((e) => e.toJson()).toList();

    final req = Request(
      method: RequestMethod.put,
      endpoint: "${Endpoints.adminSchoolsAlumnus}/$collegeId",
      body: body,
    );

    try {
      final result = await _network.request(req);
      final response = result.data as Map<String, dynamic>;
      if (response.isNotEmpty && response['data'] != null) {
        return Right(AlumniModel.fromJson(response['data'] as Map<String, dynamic>));
      }
    } catch (e) {
      return Left(APIException.from(e));
    }
    return Right(null);
  }

  @override
  ResultFuture<String?> deleteAlumniBySchool({required String collegeId}) async {
    final req = Request(
      method: RequestMethod.delete,
      endpoint: "${Endpoints.adminSchoolsAlumnus}/$collegeId",
    );

    try {
      final result = await _network.request(req);
      final response = result.data as Map<String, dynamic>;
      if (response.isNotEmpty) {
        return Right(response['message'] as String?);
      }
    } catch (e) {
      return Left(APIException.from(e));
    }
    return Right(null);
  }
}