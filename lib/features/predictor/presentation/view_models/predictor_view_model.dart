import 'package:mycampusinfo_app/core/common/view_state_provider.dart';
import 'package:mycampusinfo_app/core/network/app_failure.dart';
import 'package:mycampusinfo_app/features/predictor/data/data_source/data_source_impl.dart';

import '../../../../common/models/college_card_model.dart';

class PrefViewModel extends ViewStateProvider {
  final PredictorDataSourceImpl _predictorService = PredictorDataSourceImpl();
  List<CollegeCardModel> _predictedSchools = [];

  List<CollegeCardModel> get predictedSchools => _predictedSchools;

  Future<Failure?> predictSchools({
    required Map<String, dynamic> filters,
  }) async {
    Failure? failure;
    setViewState(ViewState.busy);

    final result = await _predictorService.predictSchools(filters);

    result.fold(
      (exception) {
        failure = APIFailure.fromException(exception: exception);
      },
      (schools) {
        _predictedSchools = schools ?? [];
      },
    );

    setViewState(ViewState.complete);
    return failure;
  }
}
