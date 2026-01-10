import 'package:dartz/dartz.dart';
import 'package:mycampusinfo_app/core/network/index.dart';
import 'package:mycampusinfo_app/features/detailPages/reviews/data/entities/review-model.dart';

import 'data_source.dart';

class ReviewService implements AbstractReviewService {
  final NetworkService _networkService = NetworkService();

  @override
  ResultFuture<List<ReviewModel>> getAcceptedReviewsBycollegeId({
    required String collegeId,
  }) async {
    // Corresponds to your GET /admin/:collegeId route
    final endpoint = "${Endpoints.reviewsBySchoolAdmin}/$collegeId";
    
    Request r = Request(method: RequestMethod.get, endpoint: endpoint);

    try {
      final result = await _networkService.request(r);
      final response = result.data as Map<String, dynamic>;

      if (response.isNotEmpty && response['data'] is List) {
        final List<ReviewModel> reviews = (response['data'] as List)
            .map((item) => ReviewModel.fromJson(item))
            .toList();
        return Right(reviews);
      }
    } catch (e) {
      return Left(APIException.from(e));
    }
    return const Right([]);
  }

  @override
  ResultFuture<ReviewModel?> addReview({
    required String collegeId,
    required String studentId,
    required String text,
    required double ratings,
  }) async {
    // Corresponds to your POST / route
    Request r = Request(
      method: RequestMethod.post,
      endpoint: '${Endpoints.reviewsBySchoolAdmin}/',
      body: {
        "collegeId": collegeId,
        "studentId": studentId,
        "text": text,
        "ratings": ratings,
      },
    );

    try {
      final result = await _networkService.request(r);
      final response = result.data as Map<String, dynamic>;
      if (response.isNotEmpty && response['data'] != null) {
        final model = ReviewModel.fromJson(response['data']);
        return Right(model);
      }
    } catch (e) {
      return Left(APIException.from(e));
    }
    return const Right(null);
  }
}