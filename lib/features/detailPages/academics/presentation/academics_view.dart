import 'package:flutter/material.dart';
import 'package:mycampusinfo_app/common/widgets/s_loading_indicator.dart';
import 'package:mycampusinfo_app/features/detailPages/overview/presentation/overview_view.dart';
import 'package:provider/provider.dart';

import '../../../../core/index.dart';
import 'view_models/academics_view_model.dart';

class CoursesView extends StatefulWidget {
  const CoursesView({required this.collegeId, super.key});
  final String collegeId;

  @override
  State<CoursesView> createState() => _CoursesViewState();
}

class _CoursesViewState extends State<CoursesView> {
  final CoursesViewModel _vm = CoursesViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _vm.getCoursesBycollegeId(collegeId: widget.collegeId);
    });
  }

  Future<void> _refresh() async {
    if (widget.collegeId.isNotEmpty) {
      await _vm.getCoursesBycollegeId(collegeId: widget.collegeId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.watch<ThemeProvider>().colors;

    return ChangeNotifierProvider.value(
      value: _vm,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<CoursesViewModel>(
          builder: (context, vm, _) {
            if (vm.viewState == ViewState.busy) {
              return const Center(child: SLoadingIndicator());
            }

            final list = vm.courses;
            if (list == null || list.isEmpty) {
              return Center(child: Text(vm.message ?? "No courses found."));
            }

            return RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: list.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16), // 👈 spacing
                itemBuilder: (_, i) {
                  final c = list[i];

                 return TitledCard(
  title: c.courseName ?? '',
  icon: Icons.school,
  iconColor: colors.amberColor,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _row("Duration", c.duration),
      _row("Intake", c.intake?.toString()),
      _row("Category", c.category),
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
            SizedBox(width: 130, child: Text(label)),
            Expanded(child: Text(val ?? "-", style: const TextStyle(fontWeight: FontWeight.w600))),
          ],
        ),
      );
}
