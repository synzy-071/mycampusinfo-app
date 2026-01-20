import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:mycampusinfo_app/common/index.dart'
    show SAppBar, SIcon, SColor, STextStyles;
import 'package:mycampusinfo_app/core/index.dart'
    show getIt, AppStateProvider, RouteNames;

import 'package:mycampusinfo_app/features/application/applications/data/entities/applications_model.dart';
import 'package:mycampusinfo_app/features/application/applications/presentation/view_models/application_view_model.dart';
class ApplicationFormView extends StatefulWidget {
  final bool forceNew;
  final StudentApplication? initialApplication;

  const ApplicationFormView({
    super.key,
    this.forceNew = false,
    this.initialApplication,
  });

  @override
  State<ApplicationFormView> createState() => _ApplicationFormViewState();
}

class _ApplicationFormViewState extends State<ApplicationFormView> {
  final _vm = ApplicationViewModel();
  final _formKey = GlobalKey<FormState>();

  // ---------------- BASIC ----------------
  final _nameCtrl = TextEditingController();
  final _locationCtrl = TextEditingController();
  final _dobCtrl = TextEditingController();
  final _motherTongueCtrl = TextEditingController();
  final _placeOfBirthCtrl = TextEditingController();
  final _nationalityCtrl = TextEditingController();
  String _gender = 'Male';
@override
void initState() {
  super.initState();

  final app = widget.initialApplication;

  if (app != null && !widget.forceNew) {
    _nameCtrl.text = app.name ?? '';
    _locationCtrl.text = app.location ?? '';
    _dobCtrl.text = app.dob?.toIso8601String().split('T').first ?? '';
    _gender = app.gender ?? 'Male';
    _motherTongueCtrl.text = app.motherTongue ?? '';
    _nationalityCtrl.text = app.nationality ?? '';

    // Courses (STRING BASED – as per your new model)
    _courseCtrls.clear();
    if (app.coursePreferences != null &&
        app.coursePreferences!.isNotEmpty) {
      for (final c in app.coursePreferences!) {
        _courseCtrls.add(TextEditingController(text: c.courseName));
      }
    } else {
      _courseCtrls.add(TextEditingController());
    }

    // Qualification
    _qualLevelCtrl.text = app.latestQualification?.level ?? '';
    _qualBoardCtrl.text =
        app.latestQualification?.boardOrUniversity ?? '';
    _qualYearCtrl.text =
        app.latestQualification?.passingYear?.toString() ?? '';
    _qualPercentageCtrl.text =
        app.latestQualification?.percentage?.toString() ?? '';

    // Academic
    _streamCtrl.text = app.academicDetails?.stream ?? '';
  }
}

  bool _speciallyAbled = false;
  final _speciallyAbledTypeCtrl = TextEditingController();

  // ---------------- FATHER ----------------
  final _fatherNameCtrl = TextEditingController();
  final _fatherAgeCtrl = TextEditingController();
  final _fatherQualificationCtrl = TextEditingController();
  final _fatherProfessionCtrl = TextEditingController();
  final _fatherIncomeCtrl = TextEditingController();
  final _fatherPhoneCtrl = TextEditingController();
  final _fatherEmailCtrl = TextEditingController();

  // ---------------- MOTHER ----------------
  final _motherNameCtrl = TextEditingController();
  final _motherAgeCtrl = TextEditingController();
  final _motherQualificationCtrl = TextEditingController();
  final _motherProfessionCtrl = TextEditingController();
  final _motherIncomeCtrl = TextEditingController();
  final _motherPhoneCtrl = TextEditingController();
  final _motherEmailCtrl = TextEditingController();

  // ---------------- ADDRESS ----------------
  final _presentAddressCtrl = TextEditingController();
  final _permanentAddressCtrl = TextEditingController();

  // ---------------- COURSE PREF (STRING) ----------------
  final List<TextEditingController> _courseCtrls = [TextEditingController()];

  // ---------------- QUALIFICATION ----------------
  final _qualLevelCtrl = TextEditingController();
  final _qualBoardCtrl = TextEditingController();
  final _qualYearCtrl = TextEditingController();
  final _qualPercentageCtrl = TextEditingController();

  // ---------------- ACADEMIC ----------------
  final _streamCtrl = TextEditingController();
  final List<_SubjectField> _subjects = [];

  // ---------------- OTHER ----------------
  final _yearlyBudgetCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _locationCtrl.dispose();
    _dobCtrl.dispose();
    _motherTongueCtrl.dispose();
    _placeOfBirthCtrl.dispose();
    _nationalityCtrl.dispose();
    _speciallyAbledTypeCtrl.dispose();

    _fatherNameCtrl.dispose();
    _fatherAgeCtrl.dispose();
    _fatherQualificationCtrl.dispose();
    _fatherProfessionCtrl.dispose();
    _fatherIncomeCtrl.dispose();
    _fatherPhoneCtrl.dispose();
    _fatherEmailCtrl.dispose();

    _motherNameCtrl.dispose();
    _motherAgeCtrl.dispose();
    _motherQualificationCtrl.dispose();
    _motherProfessionCtrl.dispose();
    _motherIncomeCtrl.dispose();
    _motherPhoneCtrl.dispose();
    _motherEmailCtrl.dispose();

    _presentAddressCtrl.dispose();
    _permanentAddressCtrl.dispose();

    for (final c in _courseCtrls) {
      c.dispose();
    }

    _qualLevelCtrl.dispose();
    _qualBoardCtrl.dispose();
    _qualYearCtrl.dispose();
    _qualPercentageCtrl.dispose();

    _streamCtrl.dispose();
    for (final s in _subjects) {
      s.dispose();
    }

    _yearlyBudgetCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickDob() async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
      initialDate: DateTime(2005),
    );
    if (picked != null) {
      _dobCtrl.text = picked.toIso8601String().split('T').first;
      setState(() {});
    }
  }

  void _addCourse() =>
      setState(() => _courseCtrls.add(TextEditingController()));

  void _addSubject() => setState(() => _subjects.add(_SubjectField()));

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final studId = getIt<AppStateProvider>().user?.sId;
    if (studId == null) return;

    final app = StudentApplication(
      studId: studId,
      name: _nameCtrl.text.trim(),
      location: _locationCtrl.text.trim(),
      dob: DateTime.tryParse(_dobCtrl.text),
      gender: _gender,
      motherTongue: _motherTongueCtrl.text.trim(),
      placeOfBirth: _placeOfBirthCtrl.text.trim(),
      nationality: _nationalityCtrl.text.trim(),
      speciallyAbled: _speciallyAbled,
      speciallyAbledType:
          _speciallyAbledTypeCtrl.text.trim().isEmpty
              ? null
              : _speciallyAbledTypeCtrl.text.trim(),

      fatherName: _fatherNameCtrl.text.trim(),
      fatherAge: int.tryParse(_fatherAgeCtrl.text),
      fatherQualification: _fatherQualificationCtrl.text.trim(),
      fatherProfession: _fatherProfessionCtrl.text.trim(),
      fatherAnnualIncome: _fatherIncomeCtrl.text.trim(),
      fatherPhoneNo: _fatherPhoneCtrl.text.trim(),
      fatherEmail: _fatherEmailCtrl.text.trim(),

      motherName: _motherNameCtrl.text.trim(),
      motherAge: int.tryParse(_motherAgeCtrl.text),
      motherQualification: _motherQualificationCtrl.text.trim(),
      motherProfession: _motherProfessionCtrl.text.trim(),
      motherAnnualIncome: _motherIncomeCtrl.text.trim(),
      motherPhoneNo: _motherPhoneCtrl.text.trim(),
      motherEmail: _motherEmailCtrl.text.trim(),

  

      yearlyBudget: _yearlyBudgetCtrl.text.trim(),

      coursePreferences: _courseCtrls
          .asMap()
          .entries
          .where((e) => e.value.text.isNotEmpty)
          .map(
            (e) => CoursePreference(
              priority: e.key + 1,
              courseName: e.value.text.trim(),
            ),
          )
          .toList(),

      latestQualification: LatestQualification(
        level: _qualLevelCtrl.text.trim(),
        boardOrUniversity: _qualBoardCtrl.text.trim(),
        passingYear: int.parse(_qualYearCtrl.text),
        percentage: double.parse(_qualPercentageCtrl.text),
      ),

      academicDetails: AcademicDetails(
        stream: _streamCtrl.text.trim(),
        subjects: _subjects
            .map(
              (s) => SubjectMark(
                subjectName: s.name.text,
                marksObtained: double.parse(s.marks.text),
                maxMarks: double.parse(s.maxMarks.text),
              ),
            )
            .toList(),
      ),
    );

    await _vm.addApplication(app);
    if (!mounted) return;

    context.pushNamed(RouteNames.applicationSuccess);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _vm,
      child: Scaffold(
        appBar: SAppBar(
          title: "Application Form",
          leading: SIcon(
            icon: Icons.arrow_back,
            onTap: () => context.pop(),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _section("Student Details"),
                _input("Name", _nameCtrl, req: true),
                _input("Location", _locationCtrl, req: true),
                _dateInput("DOB", _dobCtrl, _pickDob),
                _dropdown("Gender", _gender, ["Male", "Female", "Other"],
                    (v) => setState(() => _gender = v!)),
                _input("Mother Tongue", _motherTongueCtrl),
                _input("Nationality", _nationalityCtrl, req: true),

                SwitchListTile(
                  title: const Text("Specially Abled"),
                  value: _speciallyAbled,
                  onChanged: (v) => setState(() => _speciallyAbled = v),
                ),
                if (_speciallyAbled)
                  _input("Disability Type", _speciallyAbledTypeCtrl),

                _section("Course Preferences"),
                ..._courseCtrls.map((c) => _input("Course Name", c)),
                TextButton.icon(
                  onPressed: _addCourse,
                  icon: const Icon(Icons.add),
                  label: const Text("Add Course"),
                ),

                _section("Latest Qualification"),
                _input("Level", _qualLevelCtrl, req: true),
                _input("Board / University", _qualBoardCtrl, req: true),
                _input("Passing Year", _qualYearCtrl,
                    keyboard: TextInputType.number),
                _input("Percentage", _qualPercentageCtrl,
                    keyboard: TextInputType.number),

                _section("Academic Details"),
                _input("Stream", _streamCtrl, req: true),
                TextButton.icon(
                  onPressed: _addSubject,
                  icon: const Icon(Icons.add),
                  label: const Text("Add Subject"),
                ),
                ..._subjects.map((s) => s.widget()),

                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: SColor.primaryColor,
                    minimumSize: const Size.fromHeight(48),
                  ),
                  child: const Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ---------------- UI HELPERS ----------------

  Widget _section(String t) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(
          t,
          style: STextStyles.s18W600.copyWith(color: SColor.secTextColor),
        ),
      );

  Widget _input(String l, TextEditingController c,
      {bool req = false, TextInputType? keyboard}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: c,
        keyboardType: keyboard,
        validator: req ? (v) => v!.isEmpty ? '$l required' : null : null,
        decoration:
            InputDecoration(labelText: l, border: const OutlineInputBorder()),
      ),
    );
  }

  Widget _dateInput(
      String l, TextEditingController c, VoidCallback pick) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: c,
        readOnly: true,
        onTap: pick,
        decoration: InputDecoration(
          labelText: l,
          suffixIcon: const Icon(Icons.calendar_today),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _dropdown(String l, String v, List<String> items,
      ValueChanged<String?> onChanged) {
    return DropdownButtonFormField(
      value: v,
      items:
          items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
      onChanged: onChanged,
      decoration:
          InputDecoration(labelText: l, border: const OutlineInputBorder()),
    );
  }
}

class _SubjectField {
  final name = TextEditingController();
  final marks = TextEditingController();
  final maxMarks = TextEditingController();

  void dispose() {
    name.dispose();
    marks.dispose();
    maxMarks.dispose();
  }

  Widget widget() => Column(
        children: [
          TextFormField(
              controller: name,
              decoration: const InputDecoration(labelText: "Subject")),
          TextFormField(
              controller: marks,
              decoration: const InputDecoration(labelText: "Marks")),
          TextFormField(
              controller: maxMarks,
              decoration: const InputDecoration(labelText: "Max Marks")),
          const Divider(),
        ],
      );
}


class _AlreadyFilledMessage extends StatelessWidget {
  final List<StudentApplication> applications;
  const _AlreadyFilledMessage({required this.applications});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle, size: 64, color: Colors.green),
            const SizedBox(height: 12),
            Text(
              "You’ve already submitted ${applications.length} application(s).",
              textAlign: TextAlign.center,
              style: STextStyles.s16W600.copyWith(color: SColor.secTextColor),
            ),
            const SizedBox(height: 8),
            Text(
              "Generate pdf for your application to add it in your eligible applications.Choose an application to generate or download its PDF.",
              textAlign: TextAlign.center,
              style: STextStyles.s12W400.copyWith(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // List of existing applications (compact)
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 260),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: applications.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, i) {
                  final app = applications[i];
                  final title =
                      (app.name?.isNotEmpty == true)
                          ? app.name!
                          : (app.studId ?? 'Application ${i + 1}');
                  final subtitle =
                      app.createdAt != null
                          ? app.createdAt.toString().split('T').first
                          : '';
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    title: Text(title, style: STextStyles.s14W600),
                    subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          tooltip: "View PDF",
                          icon: const Icon(Icons.picture_as_pdf),
                          onPressed: () {
                            // Navigate to PDF view and pass applicationId
                            context.pushNamed(
                              RouteNames.applicationPdf,
                              extra: {'applicationId': app.applicationId},
                            );
                          },
                        ),
                        IconButton(
                          tooltip: "Download PDF",
                          icon: const Icon(Icons.download),
                          onPressed: () {
                            // Navigate to same route but with download intent OR call a download helper.
                            // We'll push route and pass download flag — implement handling in pdf screen.
                            context.pushNamed(
                              RouteNames.applicationPdf,
                              extra: {
                                'applicationId': app.applicationId,
                                'download': true,
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    onTap: () {
                      // quick tap opens view
                      context.pushNamed(
                        RouteNames.applicationPdf,
                        extra: {'applicationId': app.applicationId},
                      );
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            // Actions row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Add Another Application
                SizedBox(
                  width: 160,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // open form page in force-new mode
                      context.pushNamed(
                        RouteNames.addApplication,
                        extra: {'forceNew': true},
                      );
                    },
                    icon: const Icon(Icons.add, color: Colors.black),
                    label: Text(
                      "Add another",
                      style: STextStyles.s14W600.copyWith(
                        color: SColor.secTextColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Go Back
                SizedBox(
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: SColor.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      "Go Back",
                      style: STextStyles.s14W600.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

