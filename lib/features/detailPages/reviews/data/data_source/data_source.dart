import 'package:mycampusinfo_app/core/network/index.dart' show ResultFuture;
import 'package:mycampusinfo_app/features/detailPages/reviews/data/entities/review-model.dart';


abstract class AbstractReviewService {
  ResultFuture<List<ReviewModel>> getAcceptedReviewsBycollegeId({
    required String collegeId,
  });

  ResultFuture<ReviewModel?> addReview({
    required String collegeId,
    required String studentId, // You'll need to get this from your auth provider
    required String text,
    required double ratings,
  });
}