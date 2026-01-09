import 'package:mycampusinfo_app/core/network/index.dart' show ResultFuture;
import 'package:mycampusinfo_app/features/detailPages/safetySecurity/data/entities/safety-security-model.dart';


abstract class AbstractSafetyAndSecurityService {
  ResultFuture<SafetyAndSecurityModel?> getSafetyAndSecurityBySchoolId({
    required String schoolId,
  });
}