import 'package:mycampusinfo_app/core/common/view_state_provider.dart';
import 'package:mycampusinfo_app/core/network/app_failure.dart';
import 'package:mycampusinfo_app/features/predictor/data/data_source/data_source_impl.dart';

class PrefViewModel extends ViewStateProvider {
  final PredictorDataSourceImpl _predictorService =
      PredictorDataSourceImpl();

  List<String> _predictedColleges = [];
  List<String> get predictedColleges => _predictedColleges;

  Future<Failure?> predictSchools({
    required Map<String, dynamic> filters,
  }) async {
    Failure? failure;

    setViewState(ViewState.busy); // 🔄 START LOADER

    final result = await _predictorService.predictColleges(filters);

    result.fold(
      (exception) {
        failure = APIFailure.fromException(exception: exception);
      },
      (colleges) {
        _predictedColleges = colleges ?? [];
      },
    );

    setViewState(ViewState.complete); // ✅ STOP LOADER
    return failure;
  }
}
