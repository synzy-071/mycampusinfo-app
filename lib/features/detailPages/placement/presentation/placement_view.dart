import 'package:flutter/material.dart';
import 'package:mycampusinfo_app/common/widgets/s_loading_indicator.dart';
import 'package:mycampusinfo_app/features/detailPages/overview/presentation/overview_view.dart';
import 'package:mycampusinfo_app/features/detailPages/placement/presentation/view_models/placement_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../core/index.dart';

class PlacementView extends StatefulWidget {
  const PlacementView({required this.collegeId, super.key});
  final String collegeId;

  @override
  State<PlacementView> createState() => _PlacementViewState();
}

class _PlacementViewState extends State<PlacementView> {
  final PlacementViewModel _vm = PlacementViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _vm.getPlacementsBycollegeId(collegeId: widget.collegeId);
    });
  }

  Future<void> _refresh() async {
    if (widget.collegeId.isNotEmpty) {
      await _vm.getPlacementsBycollegeId(collegeId: widget.collegeId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.watch<ThemeProvider>().colors;

    return ChangeNotifierProvider.value(
      value: _vm,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<PlacementViewModel>(
          builder: (context, vm, _) {
            if (vm.viewState == ViewState.busy) {
              return const Center(child: SLoadingIndicator());
            }

            final list = vm.placements;
            if (list == null || list.isEmpty) {
              return Center(child: Text(vm.message ?? "No placement data found."));
            }

            return RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: list.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (_, i) {
                  final p = list[i];

                  return TitledCard(
                    title: "Placement ${p.year}",
                    icon: Icons.work,
                    iconColor: colors.amberColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _row("Total Students", p.totalStudents?.toString()),
                        _row("Placed Students", p.placedStudents?.toString()),
                        _row("Highest Package", "₹ ${p.highestPackage}"),
                        _row("Average Package", "₹ ${p.averagePackage}"),
                        const SizedBox(height: 8),
                        const Text("Top Recruiters",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Wrap(
                          spacing: 8,
                          children: p.topRecruiters
                              .map((e) => Chip(label: Text(e)))
                              .toList(),
                        )
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _row(String label, String? val) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            SizedBox(width: 140, child: Text(label)),
            Expanded(child: Text(val ?? "-", style: const TextStyle(fontWeight: FontWeight.w600))),
          ],
        ),
      );
}
