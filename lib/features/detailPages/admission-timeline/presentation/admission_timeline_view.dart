import 'package:flutter/material.dart';
import 'package:mycampusinfo_app/common/index.dart';
import 'package:mycampusinfo_app/core/index.dart';
import 'package:mycampusinfo_app/features/application/forms/presentation/view_models/my_form_view_model.dart';
import 'package:mycampusinfo_app/features/detailPages/admission-timeline/presentation/view_models/admission_view_model.dart';
import 'package:mycampusinfo_app/features/detailPages/admission-timeline/presentation/widgets/admission_widgets.dart';
import 'package:provider/provider.dart';

class AdmissionTimelineView extends StatefulWidget {
  const AdmissionTimelineView({super.key, required this.collegeId});
  final String collegeId;
  @override
  State<AdmissionTimelineView> createState() => _AdmissionTimelineViewState();
}

class _AdmissionTimelineViewState extends State<AdmissionTimelineView> {
  final AdmissionTimelineViewModel _vm = AdmissionTimelineViewModel();
  final MyFormViewModel _myFormViewModel = getIt<MyFormViewModel>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _vm.getAdmissionTimelineBycollegeId(collegeId: widget.collegeId);
    });
  }

  Future<void> _refresh() async {
    if (widget.collegeId.isNotEmpty) {
      await _vm.getAdmissionTimelineBycollegeId(collegeId: widget.collegeId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _vm,
      child: Scaffold(
        body: Consumer<AdmissionTimelineViewModel>(
          builder: (context, vm, _) {
            if (vm.viewState == ViewState.busy) {
              return const Center(child: SLoadingIndicator());
            }

            final timelines = vm.admissionTimeline?.timelines ?? [];

            if (timelines.isEmpty) {
              return Center(
                child: Text(vm.message ?? "No admission timeline data found."),
              );
            }

            return ChangeNotifierProvider<MyFormViewModel>.value(
              value: _myFormViewModel,
              child: Consumer<MyFormViewModel>(
                builder: (vmContext, vm, _) {
                  if (vm.isLoading) return Center(child: SLoadingIndicator());

                  return RefreshIndicator(
                    onRefresh: _refresh,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(16.0),
                      itemCount: timelines.length,
                      itemBuilder: (_, index) {
                        return TimelineCard(
                          timeline: timelines[index],
                          collegeId: widget.collegeId,
                          contextForSheet: vmContext,
                        );
                      },
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
}
