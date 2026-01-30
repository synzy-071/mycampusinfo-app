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
  final TextEditingController _feeRangeController = TextEditingController();
  final TextEditingController _collegeModeController = TextEditingController();
  final TextEditingController _genderTypeController = TextEditingController();
  final TextEditingController _streamController = TextEditingController();
  final TextEditingController _activitiesController = TextEditingController();

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
                  "Your Options. Your College.",
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
                  "Discover colleges that match your exact requirements.",
                  style: STextStyles.s15W400.copyWith(
                    color: colors.amberColor,
                  ),
                ),
                const SizedBox(height: 23),

                _buildLabel("Select your preferred fee range"),
                const SizedBox(height: 8),
                STextField.dropdown(
                  controller: _feeRangeController,
                  items: const [
                    "1000 - 10000",
                    "10000 - 25000",
                    "25000 - 50000",
                    "50000 - 75000",
                    "75000 - 100000",
                    "1 Lakh - 2 Lakh",
                    "2 Lakh - 3 Lakh",
                    "3 Lakh - 4 Lakh",
                    "4 Lakh - 5 Lakh",
                    "More than 5 Lakh",
                  ],
                  label: "Fee Range",
                  hint: "Select fee range",
                ),

                const SizedBox(height: 16),

                _buildLabel("Select your preferred college stream"),
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

                const SizedBox(height: 16),

                _buildLabel("College is famous for"),
                const SizedBox(height: 8),
                STextField.dropdown(
                  controller: _activitiesController,
                  items: const [
                    "Sports",
                    "Research",
                    "Placements",
                    "Cultural Activities",
                    "Innovation",
                    "Entrepreneurship",
                    "Coding Culture",
                    "International Exposure",
                  ],
                  label: "Activities / Famous For",
                  hint: "Select speciality",
                ),

                const SizedBox(height: 16),

                _buildLabel("Select your preferred college mode"),
                const SizedBox(height: 8),
                STextField.dropdown(
                  controller: _collegeModeController,
                  items: const ['convent', 'private', 'government'],
                  label: "College Mode",
                  hint: "Select mode",
                ),

                const SizedBox(height: 16),

                _buildLabel("Select preferred gender type"),
                const SizedBox(height: 8),
                STextField.dropdown(
                  controller: _genderTypeController,
                  items: const ['boy', 'girl', 'co-ed'],
                  label: "Gender Type",
                  hint: "Select gender",
                ),

                const SizedBox(height: 24),

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
                        label: "Get Colleges",
                        onPressed: () async {
                          final filters = {
                            if (_feeRangeController.text.isNotEmpty)
                              'feeRange': _feeRangeController.text,
                            if (_streamController.text.isNotEmpty)
                              'stream': _streamController.text,
                            if (_activitiesController.text.isNotEmpty)
                              'activities': [_activitiesController.text],
                            if (_collegeModeController.text.isNotEmpty)
                              'collegeMode': _collegeModeController.text,
                            if (_genderTypeController.text.isNotEmpty)
                              'genderType': _genderTypeController.text,
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
                                  style:
                                      TextStyle(color: colors.amberColor),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    );
                  },
                ),

                const SizedBox(height: 12),
                Text(
                  "Predictions are AI-generated and may not reflect actual outcomes.",
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
