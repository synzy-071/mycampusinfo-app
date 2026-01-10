import 'package:mycampusinfo_app/common/index.dart';
import 'package:mycampusinfo_app/core/index.dart';
import 'package:mycampusinfo_app/features/compare/data/data_source/data_source_impl.dart';
import 'package:mycampusinfo_app/features/compare/data/entities/school_compare_model.dart';

class CompareViewModel extends ViewStateProvider {
  final CompareDataSourceImpl _dataSource = CompareDataSourceImpl();

  // optional: hold base school locally (for preview on CompareWith)
  CollegeCardModel? _baseSchool;
  CollegeCardModel? get baseSchool => _baseSchool;
  void setBaseSchool(CollegeCardModel s) {
    _baseSchool = s;
    notifyListeners();
  }

  SchoolCompareModel? _school1;
  SchoolCompareModel? _school2;

  SchoolCompareModel? get school1 => _school1;
  SchoolCompareModel? get school2 => _school2;

  Future<Failure?> compareSchools({
    required String collegeId1,
    required String collegeId2,
  }) async {
    setViewState(ViewState.busy);
    Failure? failure;

    final result = await _dataSource.compareSchools(
      collegeId1: collegeId1,
      collegeId2: collegeId2,
    );

    result.fold((ex) => failure = APIFailure.fromException(exception: ex), (
      res,
    ) {
      _school1 = res?['school1'];
      _school2 = res?['school2'];
    });

    setViewState(ViewState.complete);
    return failure;
  }
}
