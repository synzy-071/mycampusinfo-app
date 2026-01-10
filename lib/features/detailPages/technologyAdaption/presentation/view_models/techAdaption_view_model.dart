import 'package:mycampusinfo_app/core/common/view_state_provider.dart';
import 'package:mycampusinfo_app/core/network/app_failure.dart';
import 'package:mycampusinfo_app/features/detailPages/technologyAdaption/data/data_source/data_source_impl.dart';
import 'package:mycampusinfo_app/features/detailPages/technologyAdaption/data/entities/techAdaption.dart';


class TechnologyAdoptionViewModel extends ViewStateProvider {
  final TechnologyAdoptionService _svc = TechnologyAdoptionService();

  TechnologyAdoptionModel? _techAdoption;
  TechnologyAdoptionModel? get techAdoption => _techAdoption;

  String? _message;
  String? get message => _message;

  Future<Failure?> getTechnologyAdoptionBycollegeId({
    required String collegeId,
  }) async {
    Failure? failure;
    setViewState(ViewState.busy);

    final result = await _svc.getTechnologyAdoptionBycollegeId(collegeId: collegeId);

    result.fold(
      (exception) {
        failure = APIFailure.fromException(exception: exception);
        _message = failure?.message;
        _techAdoption = null;
      },
      (res) {
        _techAdoption = res;
        _message = null;
      },
    );

    setViewState(ViewState.complete);
    notifyListeners();
    return failure;
  }
}