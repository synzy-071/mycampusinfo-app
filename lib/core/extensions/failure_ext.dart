import 'package:flutter/material.dart' show BuildContext;
import 'package:mycampusinfo_app/core/network/app_failure.dart' show Failure;
import 'package:mycampusinfo_app/core/utils/toast.dart' show Toasts;

extension FailureExt on Failure {
  bool get isExists => message != null && statusCode != null;

  void showError(BuildContext context) {
    if (statusCode != 500) {
      Toasts.showErrorToast(
        context,
        message: message ?? 'Something Went Wrong',
      );
    } else {
      print('Issue found: $message with $statusCode');
    }
  }
}
