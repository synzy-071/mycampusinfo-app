import 'package:mycampusinfo_app/core/common/view_state_provider.dart';
import 'package:mycampusinfo_app/core/network/app_failure.dart';
import 'package:mycampusinfo_app/features/users/preference/pref_service.dart';

class PrefViewModel extends ViewStateProvider {
  final PrefService _prefService = PrefService();

  Future<Failure?> addPreferences({
    required String studentId,
    required String state,
    required String city,
    required String boards,
    required String preferredStandard,
    required String interests,
    required String collegeType,
    required String shift,
  }) async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await _prefService.addPreferences(
      boards: boards,
      city: city,
      interests: interests,
      preferredStandard: preferredStandard,
      collegeType: collegeType,
      shift: shift,
      state: state,
      studentId: studentId,
    );

    result.fold((exception) {
      failure = APIFailure.fromException(exception: exception);
    }, (res) {});

    setViewState(ViewState.complete);

    return failure;
  }

  Future<Failure?> updatePreferences({
    required String studentId,
    required String state,
    required String city,
    required String boards,
    required String preferredStandard,
    required String interests,
    required String collegeType,
    required String shift,
  }) async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await _prefService.updatePreferences(
      boards: boards,
      city: city,
      interests: interests,
      preferredStandard: preferredStandard,
      collegeType: collegeType,
      shift: shift,
      state: state,
      studentId: studentId,
    );

    result.fold((exception) {
      failure = APIFailure.fromException(exception: exception);
    }, (res) {});

    setViewState(ViewState.complete);

    return failure;
  }

  Future<Failure?> getPreferences({required String studentId}) async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await _prefService.getPreferences(studentId: studentId);

    result.fold((exception) {
      failure = APIFailure.fromException(exception: exception);
    }, (res) {});

    setViewState(ViewState.complete);

    return failure;
  }
}
