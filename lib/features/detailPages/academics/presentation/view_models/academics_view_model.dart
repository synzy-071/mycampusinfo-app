import 'package:mycampusinfo_app/core/common/view_state_provider.dart';
import 'package:mycampusinfo_app/core/network/app_failure.dart';
import 'package:mycampusinfo_app/features/detailPages/academics/data/data_source/data_source_impl.dart';
import 'package:mycampusinfo_app/features/detailPages/academics/data/entities/academics_model.dart';

class CoursesViewModel extends ViewStateProvider {
  final coursesDataSourceImpl = CoursesDataSourceImpl();

  List<CourseModel>? _courses;
  List<CourseModel>? get courses => _courses;

  String? _message;
  String? get message => _message;

  Future<Failure?> getCoursesBycollegeId({
    required String collegeId,
  }) async {
    Failure? failure;
    setViewState(ViewState.busy);

    final result = await coursesDataSourceImpl.getCoursesBycollegeId(collegeId: collegeId);

    result.fold(
      (exception) {
        failure = APIFailure.fromException(exception: exception);
        _message = failure?.message;
        _courses = null;
      },
      (res) {
        _courses = res;
        _message = null;
      },
    );

    setViewState(ViewState.complete);
    notifyListeners();
    return failure;
  }
}
