import 'package:mycampusinfo_app/core/common/view_state_provider.dart';
import 'package:mycampusinfo_app/core/network/app_failure.dart';
import 'package:mycampusinfo_app/features/detailPages/placement/data/data_source/data_source_impl.dart';
import 'package:mycampusinfo_app/features/detailPages/placement/data/entities/placement_model.dart';

class PlacementViewModel extends ViewStateProvider {
  final PlacementDataSourceImpl _svc = PlacementDataSourceImpl();

  List<PlacementModel>? _placements;
  List<PlacementModel>? get placements => _placements;

  String? _message;
  String? get message => _message;

  Future<Failure?> getPlacementsBycollegeId({
    required String collegeId,
  }) async {
    Failure? failure;
    setViewState(ViewState.busy);

    final result = await _svc.getPlacementsBycollegeId(collegeId: collegeId);

    result.fold(
      (exception) {
        failure = APIFailure.fromException(exception: exception);
        _message = failure?.message;
        _placements = null;
      },
      (res) {
        _placements = res;
        _message = null;
      },
    );

    setViewState(ViewState.complete);
    notifyListeners();
    return failure;
  }
}
