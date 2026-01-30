import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mycampusinfo_app/common/index.dart';
import 'package:mycampusinfo_app/core/index.dart';
import 'package:mycampusinfo_app/features/predictor/presentation/view_models/predictor_view_model.dart';
import 'package:provider/provider.dart';

class SchoolResultsPage extends StatefulWidget {
  const SchoolResultsPage({super.key});

  @override
  State<SchoolResultsPage> createState() => _SchoolResultPageState();
}

class _SchoolResultPageState extends State<SchoolResultsPage> {
  final PrefViewModel prefViewModel = PrefViewModel();
  late AppStateProvider appStateProvider;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      appStateProvider = getIt();

      final failure = await prefViewModel.predictSchools(
        filters: {
          'state': appStateProvider.user?.state,
          'city': appStateProvider.user?.city,
          'collegeMode': appStateProvider.userPref?.collegeType,
          'genderType': appStateProvider.user?.gender,
        },
      );

      failure?.showError(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.watch<ThemeProvider>().colors;

    return ChangeNotifierProvider.value(
      value: prefViewModel,
      child: Scaffold(
        appBar: SAppBar(
          title: 'Predicted Colleges',
          leading: SIcon(
            icon: Icons.keyboard_arrow_left,
            color: colors.amberColor,
            onTap: () => context.pop(),
          ),
        ),
        body: SafeArea(
          child: Consumer<PrefViewModel>(
            builder: (context, vm, child) {
              if (vm.isLoading) {
                return const Center(child: SLoadingIndicator());
              }

              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Predict Your Rank. Find Your College.",
                      style: STextStyles.s14W400.copyWith(
                        color: colors.amberColor,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "College Predictor",
                      style: STextStyles.s28W800.copyWith(
                        color: colors.amberColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Personalized college recommendations based on your preferences.",
                      style: STextStyles.s14W400.copyWith(
                        color: colors.amberColor,
                      ),
                    ),
                    const SizedBox(height: 24),

                    /// ===== RESULTS =====
                    if (vm.predictedColleges.isEmpty)
                      Center(
                        child: Text(
                          "No colleges found matching your criteria",
                          style: STextStyles.s16W400.copyWith(
                            color: colors.amberColor,
                          ),
                        ),
                      )
                    else
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: vm.predictedColleges.length,
                        separatorBuilder: (_, __) =>
                            const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final collegeName =
                              vm.predictedColleges[index];

                          return Card(
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor:
                                        colors.amberColor,
                                    child: Text(
                                      '${index + 1}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      collegeName,
                                      style:
                                          STextStyles.s16W600.copyWith(
                                        color: colors.amberColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),

                    const SizedBox(height: 28),

                    /// ===== EDIT PREFERENCES =====
                    Center(
                      child: SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            context.goNamed(
                              RouteNames.preferences,
                              extra: true,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colors.amberColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: const Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              "Edit Preferences",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
