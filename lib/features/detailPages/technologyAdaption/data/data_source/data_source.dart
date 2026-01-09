import 'package:mycampusinfo_app/core/network/index.dart' show ResultFuture;
import 'package:mycampusinfo_app/features/detailPages/technologyAdaption/data/entities/techAdaption.dart';


abstract class AbstractTechnologyAdoptionService {
  ResultFuture<TechnologyAdoptionModel?> getTechnologyAdoptionBySchoolId({
    required String schoolId,
  });
}