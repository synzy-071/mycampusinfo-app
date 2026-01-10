import 'package:mycampusinfo_app/common/index.dart';
import 'package:mycampusinfo_app/core/index.dart';
import 'package:mycampusinfo_app/features/users/shortlist/data/data_source/data_source_impl.dart';

class ShortlistViewModel extends ViewStateProvider {
  final ShortlistDataSourceImpl _shortlistService = ShortlistDataSourceImpl();

  List<CollegeCardModel> _schools = getIt<AppStateProvider>().shortlistSchools;
  List<CollegeCardModel> get schools => _schools;
  set schools(List<CollegeCardModel> values) {
    _schools = values;
    notifyListeners();
  }

  Future<Failure?> addShortlist({required String collegeId}) async {
    Failure? failure;
    setViewState(ViewState.busy);
    final result = await _shortlistService.addShortlist(collegeId: collegeId);

    result.fold(
      (exception) {
        failure = APIFailure.fromException(exception: exception);
      },
      (res) async {
        failure = await getShortlist();
      },
    );

    setViewState(ViewState.complete);

    return failure;
  }

  Future<Failure?> getShortlist() async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await getIt<ShortlistDataSourceImpl>().getShortlist();

    result.fold(
      (exception) {
        failure = APIFailure.fromException(exception: exception);
      },
      (res) async {
        schools = res ?? [];
        getIt<AppStateProvider>().shortlistSchools = schools;
      },
    );

    setViewState(ViewState.complete);

    return failure;
  }

  Future<Failure?> getShortlistCount() async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await _shortlistService.getShortlistCount();

    result.fold((exception) {
      failure = APIFailure.fromException(exception: exception);
    }, (res) {});

    setViewState(ViewState.complete);

    return failure;
  }

  Future<Failure?> removeShortlist({required String collegeId}) async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await _shortlistService.removeShortlist(collegeId: collegeId);

    result.fold(
      (exception) {
        failure = APIFailure.fromException(exception: exception);
      },
      (res) async {
        failure = await getShortlist();
      },
    );

    setViewState(ViewState.complete);

    return failure;
  }
}
