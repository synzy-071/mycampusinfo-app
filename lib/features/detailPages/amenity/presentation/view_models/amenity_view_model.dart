import 'package:mycampusinfo_app/core/common/view_state_provider.dart';
import 'package:mycampusinfo_app/core/network/app_failure.dart';
import 'package:mycampusinfo_app/features/detailPages/amenity/data/data_source/data_source_impl.dart';
import 'package:mycampusinfo_app/features/detailPages/amenity/data/entities/amenity_model.dart';

class AmenitiesViewModel extends ViewStateProvider {
  final AmenitiesService _svc = AmenitiesService();

  AmenitiesModel? _amenities;
  AmenitiesModel? get amenities => _amenities;

  String? _message;
  String? get message => _message;

  Future<Failure?> getAmenitiesBycollegeId({required String collegeId}) async {
    Failure? failure;
    setViewState(ViewState.busy);

    final result = await _svc.getAmenitiesBycollegeId(collegeId: collegeId);

    result.fold((exception) {
      failure = APIFailure.fromException(exception: exception);
      _message = failure?.message;
      _amenities = null;
    }, (res) {
      _amenities = res;
      _message = null;
    });

    setViewState(ViewState.complete);
    notifyListeners();
    return failure;
  }

  Future<Failure?> addAmenities({
    required String collegeId,
    required List<String> predefinedAmenities,
    List<String>? customAmenities,
  }) async {
    Failure? failure;
    setViewState(ViewState.busy);

    final result = await _svc.addAmenities(
      collegeId: collegeId,
      predefinedAmenities: predefinedAmenities,
      customAmenities: customAmenities,
    );

    result.fold((exception) {
      failure = APIFailure.fromException(exception: exception);
      _message = failure?.message;
    }, (res) {
      _amenities = res;
      _message = null;
    });

    setViewState(ViewState.complete);
    notifyListeners();
    return failure;
  }

  Future<Failure?> updateAmenities({
    required String collegeId,
    required List<String> predefinedAmenities,
    List<String>? customAmenities,
  }) async {
    Failure? failure;
    setViewState(ViewState.busy);

    final result = await _svc.updateAmenities(
      collegeId: collegeId,
      predefinedAmenities: predefinedAmenities,
      customAmenities: customAmenities,
    );

    result.fold((exception) {
      failure = APIFailure.fromException(exception: exception);
      _message = failure?.message;
    }, (res) {
      _amenities = res;
      _message = null;
    });

    setViewState(ViewState.complete);
    notifyListeners();
    return failure;
  }
}
