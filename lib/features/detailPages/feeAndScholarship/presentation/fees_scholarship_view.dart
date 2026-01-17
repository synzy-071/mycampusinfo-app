import 'package:flutter/material.dart';
import 'package:mycampusinfo_app/features/detailPages/feeAndScholarship/presentation/view_models/fees_view_model.dart';
import 'package:mycampusinfo_app/features/detailPages/feeAndScholarship/presentation/widgets/fee_table.dart';
import 'package:mycampusinfo_app/features/detailPages/feeAndScholarship/presentation/widgets/scholarship_available.dart';
import 'package:mycampusinfo_app/features/detailPages/feeAndScholarship/presentation/widgets/scholarship_card.dart';
import 'package:mycampusinfo_app/features/detailPages/otherDetails/presentation/view_models/otherDetails_view_model.dart';
import 'package:provider/provider.dart';
import 'package:mycampusinfo_app/common/index.dart';
import 'package:mycampusinfo_app/core/index.dart';
import 'package:mycampusinfo_app/common/widgets/s_loading_indicator.dart';
import 'view_models/feeAndScholarship_view_model.dart';

class FeesAndScholarshipsView extends StatefulWidget {
  const FeesAndScholarshipsView({super.key, required this.collegeId});
  final String collegeId;

  @override
  State<FeesAndScholarshipsView> createState() =>
      _FeesAndScholarshipsViewState();
}

class _FeesAndScholarshipsViewState extends State<FeesAndScholarshipsView> {
  final _feesVm = FeesViewModel();
  final _scholarshipVm = ScholarshipViewModel();
  final _otherVm = OtherDetailsViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        _feesVm.getFeesByCollegeId(collegeId: widget.collegeId),
        _scholarshipVm.getScholarshipsByCollegeId(
          collegeId: widget.collegeId,
        ),
        _otherVm.getOtherDetailsBycollegeId(
          collegeId: widget.collegeId,
        ),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.watch<ThemeProvider>().colors;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _feesVm),
        ChangeNotifierProvider.value(value: _scholarshipVm),
        ChangeNotifierProvider.value(value: _otherVm),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Consumer3<
            FeesViewModel,
            ScholarshipViewModel,
            OtherDetailsViewModel>(
          builder: (context, feesVm, scholarshipVm, otherVm, _) {
            if (feesVm.viewState == ViewState.busy ||
                scholarshipVm.viewState == ViewState.busy ||
                otherVm.viewState == ViewState.busy) {
              return Center(
                child: SLoadingIndicator(
                  color: colors.primaryColor,
                ),
              );
            }

            final fees = feesVm.fees;
            final scholarships = scholarshipVm.scholarships;
            final other = otherVm.otherDetails;

            if (fees.isEmpty && scholarships.isEmpty) {
              return const Center(child: Text('No data available'));
            }

            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                /// ==========================
                /// 🟡 FEES SECTION
                /// ==========================
                Text(
                  'Fee Details',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),

                if (fees.isNotEmpty)
                  FeesTable(
                    fees: fees,
                    transparency: null, // backend not sending
                    colors: Colors.black,
                  )
                else
                  const Text('Fee data not available'),

                const SizedBox(height: 28),

                /// ==========================
                /// 🟡 SCHOLARSHIPS SECTION
                /// ==========================
                Text(
                  'Scholarships & Concessions',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),

                if (scholarships.isEmpty)
                  const Text('No scholarships available')
                else
                  ListView.builder(
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(),
                    itemCount: scholarships.length,
                    itemBuilder: (context, index) {
                      return ScholarshipCard(
                        scholarship: scholarships[index],
                      );
                    },
                  ),

                const SizedBox(height:4),

                /// ==========================
                /// 🟢 SCHOLARSHIP DIVERSITY
                /// ==========================
                if (other?.scholarshipDiversity != null)
                        Text(
                  'Scholarship Diversity',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),

                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: colors.borderColor),
                    ),
                    child: ScholarshipDiversityCard(
                      diversityData:
                          other!.scholarshipDiversity!,
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
