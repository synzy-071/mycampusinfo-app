import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:mycampusinfo_app/common/widgets/s_loading_indicator.dart';
import 'package:mycampusinfo_app/core/common/theme_provider.dart';
import 'package:mycampusinfo_app/core/common/view_state_provider.dart';

import 'package:mycampusinfo_app/features/detailPages/activities/presentation/view_models/activities_view_model.dart';
import 'package:mycampusinfo_app/features/detailPages/activities/presentation/widgets/activity_highlight_widget.dart';
import 'package:mycampusinfo_app/features/detailPages/activities/presentation/widgets/icon_mapper.dart';

class ActivityView extends StatefulWidget {
  const ActivityView({super.key, required this.collegeId});
  final String collegeId;
  @override
  State<ActivityView> createState() => _ActivityViewState();
}

class _ActivityViewState extends State<ActivityView> {
  final ActivitiesViewModel _vm = ActivitiesViewModel();
  // String _collegeId = '';
  // bool _parsed = false;
  @override
void initState(){
    super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
        _vm.getActivitiesBycollegeId(collegeId: widget.collegeId);
      });
}
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   if (_parsed) return;
  //   _parsed = true;

  //   final state = GoRouterState.of(context);
  //   final extra = state.extra;

  //   // --- NAVIGATION BUG FIX ---
  //   // Handle both Map (from OverviewView) and String (if pushed directly)
  //   if (extra is Map) {
  //     _collegeId = extra['collegeId'] as String? ?? '';
  //   } else if (extra is String && extra.trim().isNotEmpty) {
  //     _collegeId = extra.trim();
  //   }
  //   // --- END FIX ---

  //   if (_collegeId.isEmpty) {
  //     _collegeId = (state.pathParameters['id'] ?? '').toString();
  //   }
  //   if (_collegeId.isEmpty) {
  //     _collegeId = (state.uri.queryParameters['id'] ?? '').toString();
  //   }

  //   if (_collegeId.isNotEmpty) {
  //     WidgetsBinding.instance.addPostFrameCallback((_) {
  //       _vm.getActivitiesBycollegeId(collegeId: _collegeId);
  //     });
  //   } else {
  //     _vm.setViewState(ViewState.complete);
  //   }
  // }

  Future<void> _refresh() async {
    if (widget.collegeId.isEmpty) return;
    await _vm.getActivitiesBycollegeId(collegeId: widget.collegeId);
  }


  @override
  Widget build(BuildContext context) {
     final colors = context.watch<ThemeProvider>().colors;
    return ChangeNotifierProvider.value(
      value: _vm,
      child: Consumer<ActivitiesViewModel>(
        builder: (context, vm, _) {
          final state = vm.viewState;
          final model = vm.activitiesModel;
          final size = MediaQuery.of(context).size;
          final isSmall = size.width < 600;
          final cross = isSmall ? 2 : 3;

          return Scaffold(
            backgroundColor: Colors.white,
            // appBar: SAppBar(
            //   leading: SIcon(
            //     icon: Icons.keyboard_arrow_left,
            //     // --- NAVIGATION FIX ---
            //     onTap: () => context.pop(),
            //   ),
            //   title: "School Activities",
            // ),
            body: RefreshIndicator(
              onRefresh: _refresh,
              color: colors.amberColor, 
              child: Builder(
                builder: (_) {
                  if (widget.collegeId.isEmpty) {
                    return const Center(child: Text('Missing school context'));
                  }
                  if (state == ViewState.busy) {
                    return const Center(child: SLoadingIndicator());
                  }

                  if (model == null) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.layers_clear, size: 60, color: Colors.grey.shade400),
                          const SizedBox(height: 16),
                          Text(
                            vm.message ?? "No activities found",
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    );
                  }

                  final activities = model.activities ?? const <String>[];

                  return SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                     
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Activity Focus Areas",
                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 16),
                              if (activities.isEmpty)
                                const Text(
                                  "No activities configured for this school.",
                                )
                              else
                                GridView.count(
                                  crossAxisCount: cross,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 12,
                                  childAspectRatio: 1.2,
                                  children: activities
                                      .map(
                                        (title) => ActivityHighlightWidget(
                                          icon: ActivityIconMapper.getIconFor(title),
                                          title: title,
                                        ),
                                      )
                                      .toList(),
                                ),
                              const SizedBox(height: 24),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}