import 'package:dartz/dartz.dart';
import 'package:mycampusinfo_app/core/network/index.dart' show ResultFuture;
import 'package:mycampusinfo_app/features/detailPages/amenity/data/entities/amenity_model.dart';

abstract class AbstractAmenitiesService {
  ResultFuture<AmenitiesModel?> addAmenities({
    required String schoolId,
    required List<String> predefinedAmenities,
    List<String>? customAmenities,
  });

  ResultFuture<AmenitiesModel?> updateAmenities({
    required String schoolId,
    required List<String> predefinedAmenities,
    List<String>? customAmenities,
  });

  ResultFuture<AmenitiesModel?> getAmenitiesBySchoolId({
    required String schoolId,
  });
}