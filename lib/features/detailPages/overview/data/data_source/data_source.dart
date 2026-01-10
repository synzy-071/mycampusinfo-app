import 'package:mycampusinfo_app/core/network/typedef.dart';
import 'package:mycampusinfo_app/features/detailPages/overview/data/entities/applied_form_model.dart';
import 'package:mycampusinfo_app/features/detailPages/overview/data/entities/overview_model.dart';

abstract class OverviewDataSource {
  ResultFuture<collegeModel?> addSchool({
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
    required List<String> languageMedium,
    required String transportAvailable,
    List<String>? specialist,
    List<String>? tags,
    String? website,
    // 🆕 Added optional fields for social handles
    String? instagramHandle,
    String? twitterHandle,
    String? linkedinHandle,
  });

  ResultFuture<collegeModel?> updateSchool({
    required String id,
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
    required List<String> languageMedium,
    required String transportAvailable,
    List<String>? specialist,
    List<String>? tags,
    String? website,
    // 🆕 Added optional fields for social handles
    String? instagramHandle,
    String? twitterHandle,
    String? linkedinHandle,
  });

  ResultFuture<String?> deleteSchool({required String id});

  ResultFuture<collegeModel?> getSchoolById({required String id});

  ResultFuture<List<collegeModel>?> getSchoolsByStatus({required String status});

  ResultFuture<AppliedFormModel?> getIsSchoolApplied({
    required String collegeId,
  });
}
