// features/detailPages/exam/presentation/views/exam_view.dart
import 'package:flutter/material.dart';
import 'package:mycampusinfo_app/features/detailPages/eligible_exam/presentation/view_models/exam_view_model.dart';
import 'package:provider/provider.dart';
import '../../../../core/common/index.dart';
import '../../../../common/widgets/s_loading_indicator.dart';

class ExamView extends StatefulWidget {
  const ExamView({super.key, required this.collegeId});
  final String collegeId;

  @override
  State<ExamView> createState() => _ExamViewState();
}

class _ExamViewState extends State<ExamView> {
  final ExamViewModel _vm = ExamViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _vm.getExamsByCollegeId(collegeId: widget.collegeId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _vm,
      child: Consumer<ExamViewModel>(
        builder: (context, vm, _) {
          if (vm.viewState == ViewState.busy) {
            return const Center(child: SLoadingIndicator());
          }

          final list = vm.exams;

          if (list == null || list.isEmpty) {
            return const Center(child: Text("No exam data found"));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: list.length,
            separatorBuilder: (_, __) => const SizedBox(height: 14),
            itemBuilder: (_, i) {
              final exam = list[i];

              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.amber.withOpacity(0.6),
                    width: 1.2,
                  ),
                  boxShadow: [
                    /// Yellow glow spread (TitleCard-like highlight)
                    BoxShadow(
                      color: Colors.yellowAccent,
                      blurRadius: 1,
                      spreadRadius: 0.1,
                   
                    ),

                    /// Subtle depth shadow
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Header
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.assignment,
                            color: Colors.blue,
                            size: 22,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                exam.examName,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                exam.courseName,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    /// Chips
                    Row(
                      children: [
                        _chip(exam.marksType),
                        const SizedBox(width: 8),
                        _chip(
                          "${exam.minMarks} – ${exam.maxMarks}",
                          icon: Icons.bar_chart,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _chip(String text, {IconData? icon}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: Colors.grey.shade700),
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade800,
            ),
          ),
        ],
      ),
    );
  }
}
