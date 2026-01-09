import 'package:mycampusinfo_app/core/common/view_state_provider.dart';
import 'package:mycampusinfo_app/core/network/app_failure.dart';
import 'package:mycampusinfo_app/features/detailPages/otherDetails/data/data_source/data_source_impl.dart';
import 'package:mycampusinfo_app/features/detailPages/otherDetails/data/entities/otherDetails_model.dart';


class OtherDetailsViewModel extends ViewStateProvider {
  final OtherDetailsService _svc = OtherDetailsService();

  OtherDetailsModel? _otherDetails;
  OtherDetailsModel? get otherDetails => _otherDetails;

  String? _message;
  String? get message => _message;

  Future<Failure?> getOtherDetailsBySchoolId({
    required String schoolId,
  }) async {
    Failure? failure;
    setViewState(ViewState.busy);

    final result = await _svc.getOtherDetailsBySchoolId(schoolId: schoolId);

    result.fold(
      (exception) {
        failure = APIFailure.fromException(exception: exception);
        _message = failure?.message;
        _otherDetails = null;
      },
      (res) {
        _otherDetails = res;
        _message = null;
      },
    );

    setViewState(ViewState.complete);
    notifyListeners();
    return failure;
  }
}