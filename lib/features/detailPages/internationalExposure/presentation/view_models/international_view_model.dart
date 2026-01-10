import 'package:mycampusinfo_app/core/common/view_state_provider.dart';
import 'package:mycampusinfo_app/core/network/app_failure.dart';
import 'package:mycampusinfo_app/features/detailPages/internationalExposure/data/data_source/data_source_impl.dart';
import 'package:mycampusinfo_app/features/detailPages/internationalExposure/data/entities/international-model.dart';


class InternationalExposureViewModel extends ViewStateProvider {
  final InternationalExposureService _svc = InternationalExposureService();

  InternationalExposureModel? _exposure;
  InternationalExposureModel? get exposure => _exposure;

  String? _message;
  String? get message => _message;

  Future<Failure?> getInternationalExposureBycollegeId({
    required String collegeId,
  }) async {
    Failure? failure;
    setViewState(ViewState.busy);

    final result = await _svc.getInternationalExposureBycollegeId(collegeId: collegeId);

    result.fold(
      (exception) {
        failure = APIFailure.fromException(exception: exception);
        _message = failure?.message;
        _exposure = null;
      },
      (res) {
        _exposure = res;
        _message = null;
      },
    );

    setViewState(ViewState.complete);
    notifyListeners();
    return failure;
  }
}