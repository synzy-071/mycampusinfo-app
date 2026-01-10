import 'package:mycampusinfo_app/common/index.dart';
import 'package:mycampusinfo_app/core/index.dart';
import 'package:mycampusinfo_app/features/home/data/data_source_impl.dart';

class SchoolViewModel extends ViewStateProvider {
  final _schoolDataSource = SchoolDataSourceImpl();

  List<CollegeCardModel> _boardSchools = [];
  List<CollegeCardModel> get boardSchools => _boardSchools;
  set boardSchools(List<CollegeCardModel> value) {
    _boardSchools = value;
    notifyListeners();
  }

  List<CollegeCardModel> _nearbySchools = [];
  List<CollegeCardModel> get nearbySchools => _nearbySchools;
  set nearbySchools(List<CollegeCardModel> value) {
    _nearbySchools = value;
    notifyListeners();
  }

  List<CollegeCardModel> _stateSchools = [];
  List<CollegeCardModel> get stateSchools => _stateSchools;
  set stateSchools(List<CollegeCardModel> value) {
    _stateSchools = value;
    notifyListeners();
  }

  List<CollegeCardModel> _citySchools = [];
  List<CollegeCardModel> get citySchools => _citySchools;
  set citySchools(List<CollegeCardModel> value) {
    _citySchools = value;
    notifyListeners();
  }

  Future<Failure?> getBoardsSchools() async {
    setViewState(ViewState.busy);

    Failure? failure;

    final result = await _schoolDataSource.getSchools(
      filters: {
  
        'city': getIt<AppStateProvider>().user?.city,
      },
    );
    result.fold(
      (exception) {
        failure = APIFailure.fromException(exception: exception);
      },
      (res) {
        boardSchools = res;
      },
    );

    setViewState(ViewState.complete);
    return failure;
  }

  Future<Failure?> getStateSchools() async {
    setViewState(ViewState.busy);

    Failure? failure;

    final result = await _schoolDataSource.getSchools(
      filters: {'state': getIt<AppStateProvider>().user?.state},
    );
    result.fold(
      (exception) {
        failure = APIFailure.fromException(exception: exception);
      },
      (res) {
        stateSchools = res;
      },
    );

    setViewState(ViewState.complete);
    return failure;
  }

  Future<Failure?> getCitySchools() async {
    setViewState(ViewState.busy);

    Failure? failure;

    final result = await _schoolDataSource.getSchools(
      filters: {
        'state': getIt<AppStateProvider>().user?.state,
        'city': getIt<AppStateProvider>().user?.city,
    
        'collegeMode': getIt<AppStateProvider>().userPref?.collegeType,
        'genderType': getIt<AppStateProvider>().user?.gender,
      },
    );
    result.fold(
      (exception) {
        failure = APIFailure.fromException(exception: exception);
      },
      (res) {
        citySchools = res;
      },
    );

    setViewState(ViewState.complete);
    return failure;
  }

  // Future<Failure?> getNearbySchools() async {
  //   setViewState(ViewState.busy);
  //   Failure? failure;

  //   final user = getIt<AppStateProvider>().user;

  //   // Ensure we have all the necessary data from the user model
  //   if (user?.latitude == null ||
  //       user?.longitude == null ||
  //       user?.state == null) {
  //     setViewState(ViewState.complete);
  //     // Silently fail if location data is missing, or return a specific failure
  //     return null;
  //   }

  //   final result = await _schoolDataSource.getNearbySchools(
  //     latitude: user!.latitude!,
  //     longitude: user.longitude!,
  //     state: user.state!,
  //   );

  //   result.fold(
  //     (exception) {
  //       failure = APIFailure.fromException(exception: exception);
  //     },
  //     (res) {
  //       nearbySchools = res;
  //     },
  //   );

  //   setViewState(ViewState.complete);
  //   return failure;
  // }
}
