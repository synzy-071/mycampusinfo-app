import 'package:mycampusinfo_app/common/index.dart' show UserPref;
import 'package:mycampusinfo_app/core/index.dart' show ResultFuture;

abstract class PrefDataSource {
  ResultFuture<UserPref?> addPreferences({

    required String preferredStandard,
    required String collegeType,
    required String shift,
  });

  ResultFuture<UserPref?> updatePreferences({
   
    required String preferredStandard,
    required String collegeType,
    required String shift,
  });

  ResultFuture<UserPref?> getPreferences();
}
