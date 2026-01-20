// features/detailPages/hostel/presentation/view_models/hostel_view_model.dart

import 'package:flutter/material.dart';
import 'package:mycampusinfo_app/core/common/index.dart';
import 'package:mycampusinfo_app/features/detailPages/hostel/data/data_source/data_source.dart';
import 'package:mycampusinfo_app/features/detailPages/hostel/data/data_source/data_source_impl.dart';

import '../../data/entities/hostel_model.dart';

class HostelViewModel extends ChangeNotifier {
  final HostelDataSource _dataSource = HostelDataSourceImpl();

  ViewState _viewState = ViewState.idle;
  ViewState get viewState => _viewState;

  List<HostelModel>? _hostels;
  List<HostelModel>? get hostels => _hostels;

  Future<void> getHostelsByCollegeId({required String collegeId}) async {
    _viewState = ViewState.busy;
    notifyListeners();

    final result = await _dataSource.getHostelsByCollegeId(
      collegeId: collegeId,
    );

    result.fold(
      (error) {
        _hostels = [];
        _viewState = ViewState.idle;
        notifyListeners();
      },
      (data) {
        _hostels = data;
        _viewState = ViewState.idle;
        notifyListeners();
      },
    );
  }
}
