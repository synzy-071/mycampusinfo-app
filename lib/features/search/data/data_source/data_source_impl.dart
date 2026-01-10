import 'package:dartz/dartz.dart';
import 'package:mycampusinfo_app/common/models/college_card_model.dart';
import 'package:mycampusinfo_app/core/index.dart';
import 'package:mycampusinfo_app/features/search/data/entities/search_query.dart';

import 'data_source.dart';

class SearchDataSourceImpl implements SearchDataSource {
  final _networkService = getIt<NetworkService>();

  @override
  ResultFuture<List<CollegeCardModel>> search({
    SearchQuery? query,
    required int page,
  }) async {
    final request = Request(
      method: RequestMethod.get,
      endpoint: Endpoints.adminSearch,
      queryParams: {
        if (query != null) 'search': query.query,
        if (query?.state != null) 'state': query?.state,
        if (query?.city != null) 'cities': query?.city,
        if (query?.board != null) 'boards': query?.board,
          if (query?.genderType?.isNotEmpty ?? false) 'genderType': query?.genderType,
    if (query?.collegeMode?.isNotEmpty ?? false) 'collegeMode': query?.collegeMode,
    if (query?.feeRange != null) 'feeRange': query?.feeRange,
        'limit': "10",
        'page': page.toString(),
      },
    );

    try {
      final result = await _networkService.request(request);
      final response = result.data['data'] as List<dynamic>;

      if (response.isNotEmpty) {
        final schools =
            response.map((e) => CollegeCardModel.fromJson(e)).toList();
        return Right(schools);
      }
    } catch (e) {
      return Left(APIException.from(e));
    }

    return Right([]);
  }
}
