import 'package:mycampusinfo_app/common/index.dart';
import 'package:mycampusinfo_app/core/network/index.dart' show ResultFuture;

abstract class ShortlistDataSource {
  ResultFuture<String?> addShortlist({
    required String authId,
    required String schoolId,
  });

  ResultFuture<List<SchoolCardModel>?> getShortlist({required String authId});

  ResultFuture<int?> getShortlistCount({required String authId});

  ResultFuture<String?> removeShortlist({
    required String authId,
    required String schoolId,
  });
}
