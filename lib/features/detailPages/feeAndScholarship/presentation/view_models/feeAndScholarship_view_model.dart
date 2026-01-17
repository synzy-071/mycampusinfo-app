import 'package:mycampusinfo_app/core/common/view_state_provider.dart';
import 'package:mycampusinfo_app/features/detailPages/feeAndScholarship/data/data_source/data_source_impl.dart';
import 'package:mycampusinfo_app/features/detailPages/feeAndScholarship/data/entities/feeAndScholarship_model.dart';

class ScholarshipViewModel extends ViewStateProvider {
  final ScholarshipService _service = ScholarshipService();

  List<ScholarshipModel> _scholarships = [];
  List<ScholarshipModel> get scholarships => _scholarships;

  String? _message;
  String? get message => _message;

  Future<void> getScholarshipsByCollegeId({
    required String collegeId,
  }) async {
    setViewState(ViewState.busy);

    final result = await _service
        .getScholarshipsByCollegeId(collegeId: collegeId);

    result.fold(
      (e) {
        _scholarships = [];
        _message = e.message;
      },
      (data) {
        _scholarships = data;
        _message = null;
      },
    );

    setViewState(ViewState.complete);
    notifyListeners();
  }
}
