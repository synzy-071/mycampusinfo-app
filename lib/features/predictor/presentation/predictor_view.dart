import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:mycampusinfo_app/common/index.dart'
    show colors, STextStyles, STextField, SButton, SAppBar, SIcon;
import 'package:mycampusinfo_app/core/index.dart';
import 'package:mycampusinfo_app/features/predictor/presentation/view_models/predictor_view_model.dart';

class PredictorPage extends StatefulWidget {
  const PredictorPage({super.key});

  @override
  State<PredictorPage> createState() => _PredictorPageState();
}

class _PredictorPageState extends State<PredictorPage> {
  //  ONLY REQUIRED CONTROLLERS
  final TextEditingController _streamController = TextEditingController();
  final TextEditingController _examTypeController = TextEditingController();
  final TextEditingController _examRankController = TextEditingController();

  final PrefViewModel viewModel = PrefViewModel();

  @override
  Widget build(BuildContext context) {
    final colors = context.watch<ThemeProvider>().colors;

    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Scaffold(
        appBar: SAppBar(
          title: 'Predict Colleges',
          leading: SIcon(
            icon: Icons.keyboard_arrow_left,
            color: colors.amberColor,
            onTap: () => context.pop(),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Rank. Your Future.",
                  style: STextStyles.s18W600.copyWith(
                    color: colors.amberColor,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "College Predictor",
                  style: STextStyles.s30W900.copyWith(
                    color: colors.amberColor,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "Find colleges you can realistically get based on your exam and rank.",
                  style: STextStyles.s15W400.copyWith(
                    color: colors.amberColor,
                  ),
                ),
                const SizedBox(height: 28),

                /// STREAM
                _buildLabel("Select your stream"),
                const SizedBox(height: 8),
                STextField.dropdown(
                  controller: _streamController,
                  items: const [
                    "Engineering",
                    "Medical",
                    "Arts",
                    "Science",
                    "Commerce",
                    "Management",
                    "Law",
                    "Architecture",
                    "Design",
                  ],
                  label: "Stream",
                  hint: "Select stream",
                ),

                const SizedBox(height: 20),

                /// EXAM TYPE
                _buildLabel("Select exam type"),
                const SizedBox(height: 8),
                STextField.dropdown(
                  controller: _examTypeController,
                  items: const [
                    "JEE Main",
                    "JEE Advanced",
                    "NEET",
                    "CUET",
                    "BITSAT",
                    "COMEDK",
                    "State Entrance Exam",
                  ],
                  label: "Exam Type",
                  hint: "Select exam",
                ),

                const SizedBox(height: 20),

                /// EXAM RANK
                _buildLabel("Enter your exam rank"),
                const SizedBox(height: 8),
                STextField(
                  controller: _examRankController,
                  label: "Exam Rank",
                  hint: "Enter rank",
                ),

                const SizedBox(height: 32),

                /// 🔄 BUTTON / LOADER
                Consumer<PrefViewModel>(
                  builder: (context, vm, _) {
                    if (vm.viewState == ViewState.busy) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return Center(
                      child: SButton(
                        max: true,
                        label: "Predict Colleges",
                        onPressed: () async {
                          // ✅ ONLY 3 FIELDS SENT
                          final filters = {
                            if (_streamController.text.isNotEmpty)
                              'stream': _streamController.text,
                            if (_examTypeController.text.isNotEmpty)
                              'examType': _examTypeController.text,
                            if (_examRankController.text.isNotEmpty)
                              'examRank': int.tryParse(
                                  _examRankController.text),
                          };

                          final failure =
                              await vm.predictSchools(filters: filters);

                          if (failure == null && context.mounted) {
                            context.pushNamed(
                              RouteNames.predictorResult,
                              extra: vm.predictedColleges,
                            );
                          } else if (failure != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Error: ${failure.message}',
                                  style: TextStyle(
                                    color: colors.amberColor,
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    );
                  },
                ),

                const SizedBox(height: 14),
                Text(
                  "Predictions are AI-generated and based on past admission trends.",
                  style: STextStyles.s10W400.copyWith(
                    color: colors.amberColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    final colors = context.watch<ThemeProvider>().colors;
    return Text(
      label,
      style: STextStyles.s16W400.copyWith(
        color: colors.amberColor,
      ),
    );
  }
}
