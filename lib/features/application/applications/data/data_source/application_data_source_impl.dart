// lib/features/application/applications/data/data_source/application_data_source_impl.dart
import 'package:dartz/dartz.dart';
import 'package:mycampusinfo_app/core/index.dart'
    show
        Request,
        RequestMethod,
        NetworkService,
        Endpoints,
        APIException,
        getIt,
        AppStateProvider;
import 'package:mycampusinfo_app/features/application/applications/data/data_source/application_data_source.dart';
import 'package:mycampusinfo_app/features/application/applications/data/entities/applications_model.dart';

class ApplicationDataSourceImpl implements ApplicationDataSource {
  final NetworkService _network = getIt<NetworkService>();
  final AppStateProvider _app = getIt<AppStateProvider>();

  String get _base => '${Endpoints.baseUrl}application';

  String? _resolveStudId(String? studId) =>
      (studId != null && studId.isNotEmpty) ? studId : _app.user?.sId;

  @override
  Future<Either<APIException, StudentApplication?>> addApplication({
    required StudentApplication payload,
  }) async {
    try {
      final effectivePayload = payload.studId?.isNotEmpty == true
          ? payload
          : payload.copyWith(studId: _app.user?.sId);

      final req = Request(
        method: RequestMethod.post,
        endpoint: _base,
        body: effectivePayload.toJson(),
      );

      final resp = await _network.request(req);
      final data = (resp.data as Map<String, dynamic>)['data'];
      return Right(data == null ? null : StudentApplication.fromJson(data));
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  Future<Either<APIException, List<StudentApplication>>> getAllApplications() async {
    try {
      final req = Request(method: RequestMethod.get, endpoint: _base);
      final resp = await _network.request(req);
      final list = (resp.data as Map<String, dynamic>)['data'] as List? ?? [];
      return Right(
        list.map((e) => StudentApplication.fromJson(e)).toList(),
      );
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  Future<Either<APIException, List<StudentApplication>>> getStudApplicationsByStudId({
    required String studId,
  }) async {
    try {
      final id = _resolveStudId(studId);
      if (id == null || id.isEmpty) {
        return Left(APIException.from("Missing studId"));
      }

      final req = Request(
        method: RequestMethod.get,
        endpoint: "$_base/stud/$id",
      );

      final resp = await _network.request(req);
      final list = (resp.data as Map<String, dynamic>)['data'] as List? ?? [];

      return Right(
        list.map((e) => StudentApplication.fromJson(e)).toList(),
      );
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  Future<Either<APIException, StudentApplication?>> getApplicationById({
    required String applicationId,
  }) async {
    try {
      if (applicationId.isEmpty) {
        return Left(APIException.from("Missing applicationId"));
      }

      final req = Request(
        method: RequestMethod.get,
        endpoint: "$_base/$applicationId",
      );

      final resp = await _network.request(req);
      final data = (resp.data as Map<String, dynamic>)['data'];

      return Right(data == null ? null : StudentApplication.fromJson(data));
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  Future<Either<APIException, StudentApplication?>> updateApplication({
    required String applicationId,
    required StudentApplication payload,
  }) async {
    try {
      if (applicationId.isEmpty) {
        return Left(APIException.from("Missing applicationId"));
      }

      final req = Request(
        method: RequestMethod.put,
        endpoint: "$_base/$applicationId",
        body: payload.toJson(),
      );

      final resp = await _network.request(req);
      final data = (resp.data as Map<String, dynamic>)['data'];

      return Right(data == null ? null : StudentApplication.fromJson(data));
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  Future<Either<APIException, bool>> deleteApplication({
    required String applicationId,
  }) async {
    try {
      if (applicationId.isEmpty) {
        return Left(APIException.from("Missing applicationId"));
      }

      final req = Request(
        method: RequestMethod.delete,
        endpoint: "$_base/$applicationId",
      );

      await _network.request(req);
      return const Right(true);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }
}
