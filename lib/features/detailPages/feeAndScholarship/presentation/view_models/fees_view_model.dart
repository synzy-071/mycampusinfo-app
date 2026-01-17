import 'package:mycampusinfo_app/core/common/view_state_provider.dart';
import 'package:mycampusinfo_app/features/detailPages/feeAndScholarship/data/data_source/fee_data_source_impl.dart';
import 'package:mycampusinfo_app/features/detailPages/feeAndScholarship/data/entities/fees_model.dart';

class FeesViewModel extends ViewStateProvider {
  final FeesService _service = FeesService();

  List<ClassFeeModel> _fees = [];
  List<ClassFeeModel> get fees => _fees;

  String? _message;
  String? get message => _message;

  Future<void> getFeesByCollegeId({
    required String collegeId,
  }) async {
    setViewState(ViewState.busy);

    final result =
        await _service.getFeesByCollegeId(collegeId: collegeId);

    result.fold(
      (e) {
        _fees = [];
        _message = e.message;
      },
      (data) {
        _fees = data;
        _message = null;
      },
    );

    setViewState(ViewState.complete);
    notifyListeners();
  }
}
