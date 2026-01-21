import 'package:dartz/dartz.dart';
import 'package:mycampusinfo_app/core/index.dart';
import 'package:mycampusinfo_app/features/detailPages/overview/data/entities/applied_form_model.dart';
import 'package:mycampusinfo_app/features/detailPages/overview/data/entities/overview_model.dart';

class OverviewDataSourceImpl {
  final NetworkService _networkService = NetworkService();

  // 🏫 ADD SCHOOL
  ResultFuture<CollegeModel?> addSchool({
    required String name,
    required String description,
    required String board,
    required String state,
    required String city,
    required String collegeMode,
    required String genderType,
    required List<String> shifts,
    required String feeRange,
    required String upto,
    required String email,
    required String status,
    required String mobileNo,
    required String ranking,
    required String estYear,
    required List<String> languageMedium,
    required String transportAvailable,
    List<String>? specialist,
    List<String>? tags,
    String? website,
    // 🆕 New optional fields
    String? instagramHandle,
    String? twitterHandle,
    String? linkedinHandle,
  }) async {
    Request r = Request(
      method: RequestMethod.post,
      endpoint: Endpoints.adminSchools,
      body: {
        "name": name,
        "description": description,
        "board": board,
        "state": state,
        "city": city,
        "collegeMode": collegeMode,
        "genderType": genderType,
        "shifts": shifts,
        "feeRange": feeRange,
        "ranking": ranking,
        "estYear": estYear,
        "upto": upto,
        "email": email,
        "specialist": specialist,
        "tags": tags,
        "website": website,
        "status": status,
        "mobileNo": mobileNo,
        "languageMedium": languageMedium,
        "transportAvailable": transportAvailable,
        if (instagramHandle != null) "instagramHandle": instagramHandle,
        if (twitterHandle != null) "twitterHandle": twitterHandle,
        if (linkedinHandle != null) "linkedinHandle": linkedinHandle,
      },
    );

    try {
      final result = await _networkService.request(r);
      final response = result.data as Map<String, dynamic>;
      if (response.isNotEmpty) {
        final school = CollegeModel.fromJson(response['data']);
        return Right(school);
      }
    } catch (e) {
      return Left(APIException.from(e));
    }
    return Right(null);
  }

  // 🏫 UPDATE SCHOOL
  ResultFuture<CollegeModel?> updateSchool({
    required String id,
    required String name,
    required String description,
    required String board,
    required String state,
    required String city,
    required String collegeMode,
      required String ranking,
    required String estYear,
    required String genderType,
    required List<String> shifts,
    required String feeRange,
    required String upto,
    required String email,
    required String status,
    required String mobileNo,
    required List<String> languageMedium,
    required String transportAvailable,
    List<String>? specialist,
    List<String>? tags,
    String? website,
    // 🆕 New optional fields
    String? instagramHandle,
    String? twitterHandle,
    String? linkedinHandle,
  }) async {
    Request r = Request(
      method: RequestMethod.put,
      endpoint: "${Endpoints.adminSchools}/$id",
      body: {
        "name": name,
        "description": description,
        "board": board,
        "state": state,
        "city": city,
        "collegeMode": collegeMode,
        "genderType": genderType,
        "shifts": shifts,
        "feeRange": feeRange,
        "upto": upto,
        "email": email,
        "specialist": specialist,
        "tags": tags,
           "ranking": ranking,
        "estYear": estYear,
        "website": website,
        "status": status,
        "mobileNo": mobileNo,
        "languageMedium": languageMedium,
        "transportAvailable": transportAvailable,
        if (instagramHandle != null) "instagramHandle": instagramHandle,
        if (twitterHandle != null) "twitterHandle": twitterHandle,
        if (linkedinHandle != null) "linkedinHandle": linkedinHandle,
      },
    );

    try {
      final result = await _networkService.request(r);
      final response = result.data as Map<String, dynamic>;
      if (response.isNotEmpty) {
        final school = CollegeModel.fromJson(response['data']);
        return Right(school);
      }
    } catch (e) {
      return Left(APIException.from(e));
    }

    return Right(null);
  }

  // 🏫 DELETE SCHOOL
  ResultFuture<String?> deleteSchool({required String id}) async {
    Request r = Request(
      method: RequestMethod.delete,
      endpoint: "${Endpoints.adminSchools}/$id",
    );

    try {
      final result = await _networkService.request(r);
      final response = result.data as Map<String, dynamic>;
      if (response.isNotEmpty) {
        final msg = response['message'];
        return Right(msg);
      }
    } catch (e) {
      return Left(APIException.from(e));
    }
    return Right(null);
  }

  // 🏫 GET SCHOOL BY ID
  ResultFuture<CollegeModel?> getSchoolById({required String id}) async {
    Request r = Request(
      method: RequestMethod.get,
      endpoint: "${Endpoints.adminSchools}/$id",
    );

    try {
      final result = await _networkService.request(r);
      final response = result.data as Map<String, dynamic>;
      if (response.isNotEmpty) {
        final school = CollegeModel.fromJson(response['data']);
        return Right(school);
      }
    } catch (e) {
      return Left(APIException.from(e));
    }
    return Right(null);
  }

  // 🏫 GET SCHOOLS BY STATUS
  ResultFuture<List<CollegeModel>?> getSchoolsByStatus({
    required String status,
  }) async {
    Request r = Request(
      method: RequestMethod.get,
      endpoint: "${Endpoints.adminSchools}/status/$status",
    );

    try {
      final result = await _networkService.request(r);
      final response = result.data as Map<String, dynamic>;
      if (response.isNotEmpty) {
        final List<dynamic> schoolsData = response['data'];
        final List<CollegeModel> schools = schoolsData
            .map((json) => CollegeModel.fromJson(json))
            .toList();
        return Right(schools);
      }
    } catch (e) {
      return Left(APIException.from(e));
    }
    return Right(null);
  }

  // 🧾 CHECK IF SCHOOL APPLIED
  ResultFuture<AppliedFormModel?> getIsSchoolApplied({
    required String collegeId,
  }) async {
    final studId = getIt<AppStateProvider>().user?.sId;

    Request r = Request(
      method: RequestMethod.get,
      endpoint: "${Endpoints.formIsApplied}/$studId/$collegeId",
    );

    try {
      final result = await _networkService.request(r);
      final response = result.data as Map<String, dynamic>;
      if (response.isNotEmpty) {
        final AppliedFormModel isApplied = AppliedFormModel.fromJson(
          response['data'] as Map<String, dynamic>,
        );
        return Right(isApplied);
      }
    } catch (e) {
      return Left(APIException.from(e));
    }
    return Right(null);
  }
}
