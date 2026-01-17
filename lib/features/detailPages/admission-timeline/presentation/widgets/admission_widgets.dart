import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mycampusinfo_app/common/index.dart';
import 'package:mycampusinfo_app/core/common/app_state_provider.dart';
import 'package:mycampusinfo_app/core/common/theme_provider.dart';
import 'package:mycampusinfo_app/core/navigation/route_name.dart';
import 'package:mycampusinfo_app/features/detailPages/admission-timeline/data/entities/index.dart';
import 'package:provider/provider.dart';

import '../../../../../core/services/service_locator.dart';
import '../../../../../core/utils/toast.dart';
import '../../../../application/forms/presentation/view_models/my_form_view_model.dart';

class TimelineCard extends StatelessWidget {
  final TimeLine timeline;
  final String collegeId;
  final BuildContext contextForSheet;
  const TimelineCard({
    super.key,
    required this.timeline,
    required this.collegeId,
    required this.contextForSheet,
  });

  // --- 1. STATUS COLORS ---
  Color _getStatusColor(String? status) {
    switch (status) {
      case 'Ongoing':
        return Colors.amber.shade700;
      case 'Starting Soon':
        return Colors.orange.shade700;
      case 'Ended':
        return Colors.grey;
      default:
        return Colors.black87;
    }
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'N/A';
    return DateFormat('dd MMM, yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.watch<ThemeProvider>().colors;
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.borderColor, width: 1),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            spreadRadius: 1,
            offset: const Offset(0, 3),
            color: Colors.grey,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- HEADER ROW ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  timeline.eligibility?.admissionLevel ?? 'Admission',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              Chip(
                label: Text(timeline.status ?? 'N/A'),
                backgroundColor: _getStatusColor(
                  timeline.status,
                ).withValues(alpha: 0.1),
                labelStyle: TextStyle(
                  color: _getStatusColor(timeline.status),
                  fontWeight: FontWeight.bold,
                ),
                side: BorderSide(color: _getStatusColor(timeline.status)),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // --- INFO ROWS ---
          InfoRow(
            icon: Icons.calendar_today_outlined,
            title: 'Starts On',
            value: _formatDate(timeline.admissionStartDate),
          ),
          InfoRow(
            icon: Icons.event_available_outlined,
            title: 'Ends On',
            value: _formatDate(timeline.admissionEndDate),
          ),
          const SizedBox(height: 12),

          if (timeline.eligibility?.ageCriteria != null &&
              timeline.eligibility!.ageCriteria!.isNotEmpty)
            InfoRow(
              icon: Icons.cake_outlined,
              title: 'Age',
              value: timeline.eligibility!.ageCriteria!,
            ),
          if (timeline.eligibility?.otherInfo != null &&
              timeline.eligibility!.otherInfo!.isNotEmpty)
            InfoRow(
              icon: Icons.info_outline,
              title: 'Info',
              value: timeline.eligibility!.otherInfo!,
            ),

          if ((timeline.documentsRequired ?? []).isNotEmpty) ...[
            const SizedBox(height: 12),
            const Text(
              'Documents Required',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: (timeline.documentsRequired ?? [])
                  .map(
                    (doc) => Chip(
                      label: Text(doc),
                      backgroundColor: colors.amberLightColor,
                      side: BorderSide(color: colors.amberMedColor),
                    ),
                  )
                  .toList(),
            ),
          ],

          if (getIsAdmissionStarted(timeline)) ...[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                SButton(
                  onPressed: () => onApplyPressed(contextForSheet, false),
                  backgroundColor: SColor.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  label: '',
                  max: true,
                  text: Text(
                    'Apply Now',
                    style: STextStyles.s16W600.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  bool getIsAdmissionStarted(TimeLine timeline) {
    final currentDate = DateTime.now();

    if (timeline.admissionStartDate == null ||
        timeline.admissionEndDate == null) {
      return false;
    }

    bool started = currentDate.isBefore(timeline.admissionStartDate!);
    bool ended = currentDate.isAfter(timeline.admissionEndDate!);

    return started && ended;
  }

  Future<void> onApplyPressed(
    BuildContext sheetContext,
    bool isSingleAndApplied,
  ) async {
    final appStateProvider = getIt<AppStateProvider>();
    final MyFormViewModel myFormViewModel = getIt<MyFormViewModel>();
    String feeText = '-';

    if (isSingleAndApplied) {
      // Show dialog that prompts user to add a new application (force new)
      showDialog(
        context: sheetContext,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            title: const Text('No additional application available'),
            content: const Text(
              'You have already applied using the only available application. Would you like to add a new application?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  context.pushNamed(
                    RouteNames.addApplication,
                    extra: {'forceNew': true},
                  );
                },
                child: const Text('Fill form'),
              ),
            ],
          );
        },
      );
      return;
    }

    // --- original Apply flow (unchanged) ---
    if (appStateProvider.isGuest) {
      Toasts.showLoginToast(sheetContext);
      return;
    }

    final studId = getIt<AppStateProvider>().user?.sId;
    if (studId == null) {
      ScaffoldMessenger.of(
        sheetContext,
      ).showSnackBar(const SnackBar(content: Text("Missing student ID.")));
      return;
    }

    final pdfResult = await myFormViewModel.fetchStudentPdfs(studId: studId);
    if (pdfResult != null) {
      Toasts.showErrorToast(
        sheetContext,
        message: pdfResult.message ?? "Failed to fetch PDFs",
      );
      return;
    }

    final pdfs = myFormViewModel.availablePdfs;
    if (pdfs.isEmpty) {
      showDialog(
        context: sheetContext,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            title: const Text('No form available'),
            content: const Text(
              'No generated PDFs available. Please fill the form first.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();

                  context.pushNamed(
                    RouteNames.addApplication,
                    extra: {'forceNew': true},
                  );
                },
                child: const Text('Fill form'),
              ),
            ],
          );
        },
      );
      return;
    }
    await myFormViewModel.prefetchApplicationsForPdfs(pdfs);

    // STEP 2: pick desired application PDF
    final chosenPdfIndex = await showModalBottomSheet<int?>(
      context: sheetContext,
      isScrollControlled: true,
      builder: (_) {
        log('After opening sheet');
        // <<< PROVIDE myFormViewModel to the modal subtree so Consumer finds it >>>
        return ChangeNotifierProvider.value(
          value: myFormViewModel,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Select Application",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(sheetContext).size.height * 0.6,
                    ),
                    child: Consumer<MyFormViewModel>(
                      builder: (csheetContext, mfvm, _) {
                        log('List opening sheet');
                        return ListView.separated(
                          shrinkWrap: true,
                          itemCount: pdfs.length,
                          separatorBuilder: (_, __) => const Divider(height: 1),
                          itemBuilder: (_, i) {
                            final p = pdfs[i];
                            final title =
                                p['applicationName'] ?? 'Application ${i + 1}';
                            final subtitle =
                                p['createdAt']?.toString().split('T').first ??
                                '';

                            // 1) obtain applicationId from pdf object
                            final applicationId =
                                (p['applicationId'] ??
                                        p['_id'] ??
                                        p['formId'] ??
                                        '')
                                    .toString();

                            // 2) get cached StudentApplication if available
                            final app = applicationId.isNotEmpty
                                ? mfvm.applicationCache[applicationId]
                                : null;

                            // 3) read the standard from StudentApplication
                            // final pdfStandard =
                            //     (app?.standard ??
                            //             '')
                            //         .toString()
                            //         .trim();

                            final loading =
                                applicationId.isNotEmpty &&
                                mfvm.isAppLoading(applicationId);

                            return ListTile(
                              title: Text(title.toString()),
                              subtitle: subtitle.isNotEmpty
                                  ? Text(subtitle)
                                  : null,
                              trailing: loading
                                  ? const SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : Text(
                                      feeText,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                              onTap: () async {
                                if (applicationId.isNotEmpty &&
                                    mfvm.applicationCache[applicationId] ==
                                        null) {
                                  final err = await mfvm.fetchApplicationById(
                                    applicationId: applicationId,
                                  );
                                  if (err != null) {
                                    if (sheetContext.mounted) {
                                      Toasts.showErrorToast(
                                        sheetContext,
                                        message:
                                            err.message ??
                                            "Failed to load application",
                                      );
                                    }
                                    return;
                                  }
                                }
                                Navigator.of(sheetContext).pop(i);
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () => Navigator.of(sheetContext).pop(null),
                    child: const Text("Cancel"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    if (chosenPdfIndex == null) return;

    final chosen = pdfs[chosenPdfIndex];

    final formId = chosen['_id']?.toString() ?? "";
    final applicationId = chosen['applicationId']?.toString() ?? "";

    if (formId.isEmpty) {
      ScaffoldMessenger.of(
        sheetContext,
      ).showSnackBar(const SnackBar(content: Text("Invalid PDF selected.")));
      return;
    }

    // STEP 3: submit form
    final failure = await myFormViewModel.submitForm(
      collegeId: collegeId,
      applicationId: applicationId,
      formId: formId,
      timelineId: timeline.sId ?? '',
      amount: int.tryParse(feeText.substring(1)) ?? 0,
    );

    // Debug: check whether this page is still current / mounted
    // (works regardless of go_router version)
    try {
      final isCurrent = ModalRoute.of(sheetContext)?.isCurrent ?? false;
      // ignore: avoid_print
      print('[Apply] after submit: ModalRoute.isCurrent = $isCurrent');

      final canPop = Navigator.of(sheetContext).canPop();
      // ignore: avoid_print
      print('[Apply] after submit: Navigator.canPop = $canPop');
    } catch (e) {
      // ignore: avoid_print
      print('[Apply] debug check failed: $e');
    }

    // Only show UI when still mounted
    if (!sheetContext.mounted) {
      // ignore: avoid_print
      print(
        '[Apply] context not mounted after submit — page may have been popped.',
      );
      return;
    }

    // final paymentVM = getIt<PaymentViewModel>();

    Toasts.showSuccessOrFailureToast(
      sheetContext,
      failure: failure,
      hideSuccess: true,
      popOnSuccess: false,
      successCallback: () async {
        Toasts.showSuccessToast(
          sheetContext,
          message: 'Form submitted successfully',
        );
        return;
        // if (int.tryParse(feeText.substring(1)) == 0) {}
        //
        // final failure = await paymentVM.createOrder();
        // Toasts.showSuccessOrFailureToast(
        //   context,
        //   failure: failure,
        //   popOnSuccess: false,
        //   hideSuccess: true,
        //   successCallback: () {
        //     context.pushNamed(RouteNames.payments);
        //   },
        // );
      },
    );
  }
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? value;
  const InfoRow({
    super.key,
    required this.icon,
    required this.title,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.watch<ThemeProvider>().colors;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: colors.topTextColor),
          const SizedBox(width: 12),
          Text(
            '$title: ',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          Expanded(
            child: Text(
              value ?? 'N/A',
              style: const TextStyle(fontSize: 15, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
