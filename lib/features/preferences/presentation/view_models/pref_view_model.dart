import 'package:mycampusinfo_app/core/index.dart';
import 'package:mycampusinfo_app/features/preferences/data/data_source/data_source_impl.dart';

class PrefViewModel extends ViewStateProvider {
  final PrefDataSourceImpl prefDataSourceImpl = PrefDataSourceImpl();

  Future<Failure?> addPreferences({
    required String boards,
    required String preferredStandard,
    required String interests,
    required String collegeType,
    required String shift,
  }) async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await prefDataSourceImpl.addPreferences(
      boards: boards,
      interests: interests,
      preferredStandard: preferredStandard,
      collegeType: collegeType,
      shift: shift,
    );

    result.fold(
      (exception) {
        failure = APIFailure.fromException(exception: exception);
      },
      (res) {
        getIt<AppStateProvider>().userPref = res;
      },
    );

    setViewState(ViewState.complete);

    return failure;
  }
Future<Failure?> fetchPreferences() async {
  Failure? failure;

  setViewState(ViewState.busy);

  final result = await prefDataSourceImpl.getPreferences();

  result.fold(
    (exception) {
      failure = APIFailure.fromException(exception: exception);
    },
    (res) {
      if (res != null) {
        getIt<AppStateProvider>().userPref = res;
      }
    },
  );

  setViewState(ViewState.complete);
  return failure;
}

  Future<Failure?> updatePreferences({
    required String boards,
    required String preferredStandard,
    required String interests,
    required String collegeType,
    required String shift,
  }) async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await prefDataSourceImpl.updatePreferences(
      boards: boards,
      interests: interests,
      preferredStandard: preferredStandard,
      collegeType: collegeType,
      shift: shift,
    );

    result.fold(
      (exception) {
        failure = APIFailure.fromException(exception: exception);
      },
      (res) {
        getIt<AppStateProvider>().userPref = res;
      },
    );

    setViewState(ViewState.complete);

    return failure;
  }
}
