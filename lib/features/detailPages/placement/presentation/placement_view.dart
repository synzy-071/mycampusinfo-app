import 'package:flutter/material.dart';
import 'package:mycampusinfo_app/common/widgets/s_loading_indicator.dart';
import 'package:mycampusinfo_app/features/detailPages/infrastructure/presentation/widgets/title_card.dart';
import 'package:mycampusinfo_app/features/detailPages/placement/presentation/view_models/placement_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/index.dart';

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
    await _vm.getPlacementsBycollegeId(collegeId: widget.collegeId);
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

            final courses = vm.placements;
            if (courses == null || courses.isEmpty) {
              return Center(
                child: Text(vm.message ?? "No placement data found."),
              );
            }

            return RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: courses.length,
                separatorBuilder: (_, __) => const SizedBox(height: 20),
                itemBuilder: (_, i) {
                  final course = courses[i];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// 🔹 Course Title
                      Text(
                        course.courseName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),

                      /// 🔹 Placements per year
                      ...course.placements.map((placement) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: TitledCard(
                            title: "Placement – ${placement.year}",
                            icon: Icons.work,
                            iconColor: colors.amberColor,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _row(
                                  "Total Students",
                                  placement.totalStudents?.toString(),
                                ),
                                _row(
                                  "Placed Students",
                                  placement.placedStudents?.toString(),
                                ),
                                _row(
                                  "Min Package",
                                  placement.minPackage != null
                                      ? "₹ ${placement.minPackage}"
                                      : null,
                                ),
                                _row(
                                  "Max Package",
                                  placement.maxPackage != null
                                      ? "₹ ${placement.maxPackage}"
                                      : null,
                                ),
                                _row(
                                  "Average Package",
                                  placement.averagePackage != null
                                      ? "₹ ${placement.averagePackage}"
                                      : null,
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  "Recruiting Companies",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 4,
                                  children: placement.companies
                                      .map(
                                        (e) => Chip(
                                          label: Text(e),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ],
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
            Expanded(
              child: Text(
                val ?? "-",
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      );
}
