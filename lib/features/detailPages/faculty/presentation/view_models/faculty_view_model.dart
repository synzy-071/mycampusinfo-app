import 'package:mycampusinfo_app/core/common/view_state_provider.dart';
import 'package:mycampusinfo_app/core/network/app_failure.dart';
import 'package:mycampusinfo_app/features/detailPages/faculty/data/data_source/data_source_impl.dart';
import 'package:mycampusinfo_app/features/detailPages/faculty/data/entities/faculty-model.dart';


class FacultyViewModel extends ViewStateProvider {
  final FacultyService _svc = FacultyService();

  FacultyModel? _faculty;
  FacultyModel? get faculty => _faculty;

  String? _message;
  String? get message => _message;

  Future<Failure?> getFacultyBycollegeId({
    required String collegeId,
  }) async {
    Failure? failure;
    setViewState(ViewState.busy);

    final result = await _svc.getFacultyBycollegeId(collegeId: collegeId);

    result.fold(
      (exception) {
        failure = APIFailure.fromException(exception: exception);
        _message = failure?.message;
        _faculty = null;
      },
      (res) {
        _faculty = res;
        _message = null;
      },
    );

    setViewState(ViewState.complete);
    notifyListeners();
    return failure;
  }
}