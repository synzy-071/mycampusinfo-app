import 'package:mycampusinfo_app/common/index.dart';
import 'package:mycampusinfo_app/core/index.dart';
import 'package:mycampusinfo_app/features/search/data/entities/search_query.dart';

abstract class SearchDataSource {
  ResultFuture<List<SchoolCardModel>> search({
    required int page,
    SearchQuery? query,
  });
}
