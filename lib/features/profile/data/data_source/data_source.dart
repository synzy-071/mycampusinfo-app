import 'package:mycampusinfo_app/common/index.dart' show UserPref, User;
import 'package:mycampusinfo_app/core/index.dart' show ResultFuture;

abstract class ProfileDataSource {
  ResultFuture<User?> getUserDetails();

  ResultFuture<User?> addProfile({
    required String name,
    required String email,
    required String phone,
    required String state,
    required String city,
    required String gender,
    required String area,
    required String dateOfBirth,
    double? latitude, // <-- Add this
    double? longitude, // <-- Add this
  });

  ResultFuture<User?> updateProfile({
    required String name,
    required String email,
    required String phone,
    required String state,
    required String city,
    required String area,
    required String gender,
    required String dateOfBirth,
    double? latitude, // <-- Add this
    double? longitude, // <-- Add this
  });
}
