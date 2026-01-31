import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mycampusinfo_app/common/index.dart';
import 'package:mycampusinfo_app/core/index.dart';
import 'package:provider/provider.dart';

class SchoolResultsPage extends StatelessWidget {
  const SchoolResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.watch<ThemeProvider>().colors;

    // ✅ GET COLLEGES FROM ROUTE EXTRA
    final List<String> colleges =
        GoRouterState.of(context).extra as List<String>? ?? [];

    return Scaffold(
      appBar: SAppBar(
        title: 'Predicted Colleges',
        leading: SIcon(
          icon: Icons.keyboard_arrow_left,
          color: colors.amberColor,
          onTap: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: colleges.isEmpty
            ? Center(
                child: Text(
                  "No colleges found matching your criteria",
                  style: STextStyles.s16W400.copyWith(
                    color: colors.amberColor,
                  ),
                ),
              )
            : SingleChildScrollView(
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
                      "Personalized college recommendations based on your exam and rank.",
                      style: STextStyles.s14W400.copyWith(
                        color: colors.amberColor,
                      ),
                    ),
                    const SizedBox(height: 24),

                    /// ===== RESULTS =====
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: colleges.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final collegeName = colleges[index];

                        return Card(
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: colors.amberColor,
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
                                    style: STextStyles.s16W600.copyWith(
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
                            context.pop();
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
                              "Edit Options",
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
              ),
      ),
    );
  }
}
