import 'package:mycampusinfo_app/core/common/view_state_provider.dart';
import 'package:mycampusinfo_app/core/network/app_failure.dart';
import 'package:mycampusinfo_app/features/detailPages/placement/data/data_source/data_source_impl.dart';
import 'package:mycampusinfo_app/features/detailPages/placement/data/entities/course_placement.dart';

class PlacementViewModel extends ViewStateProvider {
  final PlacementDataSourceImpl _svc = PlacementDataSourceImpl();

  List<CoursePlacementGroup>? _placements;
  List<CoursePlacementGroup>? get placements => _placements;

  String? _message;
  String? get message => _message;

  Future<Failure?> getPlacementsBycollegeId({
    required String collegeId,
  }) async {
    setViewState(ViewState.busy);

    final result = await _svc.getPlacementsBycollegeId(collegeId: collegeId);

    result.fold(
      (exception) {
        _message = APIFailure.fromException(exception: exception).message;
        _placements = null;
      },
      (res) {
        _placements = res;
        _message = null;
      },
    );

    setViewState(ViewState.complete);
    notifyListeners();
    return null;
  }
}
