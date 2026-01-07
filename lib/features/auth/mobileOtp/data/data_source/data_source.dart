// lib/features/auth/otp/data/data_source/otp_data_source.dart
import 'package:mycampusinfo_app/core/index.dart' show ResultFuture;
import 'package:mycampusinfo_app/features/auth/mobileOtp/data/entities/otp_model.dart';


abstract class OtpDataSource {
  ResultFuture<bool> sendOtp({required String phone});
  ResultFuture<OtpVerifyPayload> verifyOtp({required String phone, required String otp});
}
