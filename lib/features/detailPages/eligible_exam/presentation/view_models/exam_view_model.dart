// features/detailPages/exam/presentation/view_models/exam_view_model.dart
import 'package:flutter/material.dart';
import 'package:mycampusinfo_app/core/common/view_state_provider.dart';
import 'package:mycampusinfo_app/features/detailPages/eligible_exam/data/data_source/data_source.dart';
import 'package:mycampusinfo_app/features/detailPages/eligible_exam/data/data_source/data_source_impl.dart';
import 'package:mycampusinfo_app/features/detailPages/eligible_exam/data/entities/course_exam_group_model.dart';


class ExamViewModel extends ChangeNotifier {
  final AbstractExamService _service = ExamDataSourceImpl();

  ViewState _viewState = ViewState.idle;
  ViewState get viewState => _viewState;

  List<CourseExam>? _exams;
  List<CourseExam>? get exams => _exams;

  String? message;

  Future<void> getExamsByCollegeId({
    required String collegeId,
  }) async {
    _viewState = ViewState.busy;
    notifyListeners();

    final result =
        await _service.getExamsByCollegeId(collegeId: collegeId);

    result.fold(
      (failure) {
        message = failure.message;
        _exams = [];
      },
      (data) {
        _exams = data;
      },
    );

    _viewState = ViewState.idle;
    notifyListeners();
  }
}
