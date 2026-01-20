// features/detailPages/hostel/data/datasources/hostel_datasource.dart

import 'package:mycampusinfo_app/core/network/typedef.dart';
import '../entities/hostel_model.dart';

abstract class HostelDataSource {
  ResultFuture<List<HostelModel>> getHostelsByCollegeId({
    required String collegeId,
  });
}
