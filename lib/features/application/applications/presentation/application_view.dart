// lib/features/application/applications/presentation/application_view.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:mycampusinfo_app/common/index.dart'
    show SAppBar, SIcon, SColor, STextStyles, SLoadingIndicator;
import 'package:mycampusinfo_app/core/index.dart' show getIt, AppStateProvider, RouteNames;
import 'package:mycampusinfo_app/features/application/applications/data/entities/applications_model.dart';
import 'package:mycampusinfo_app/features/application/applications/presentation/view_models/application_view_model.dart';
import 'package:mycampusinfo_app/features/application/pdfModule/presentation/view_models/pdf_view_model.dart';

class ApplicationFormView extends StatefulWidget {
  const ApplicationFormView({
    super.key,
    this.forceNew = false,
    this.initialApplication,
  });

  final bool forceNew;
  final StudentApplication? initialApplication;

  @override
  State<ApplicationFormView> createState() => _ApplicationFormViewState();
}

class _ApplicationFormViewState extends State<ApplicationFormView> {
  void _prefillParentAndAddress(StudentApplication app) {
    // Father
    _fatherNameCtrl.text = app.fatherName ?? '';
    _fatherAgeCtrl.text = app.fatherAge?.toString() ?? '';
    _fatherQualCtrl.text = app.fatherQualification ?? '';
    _fatherProfCtrl.text = app.fatherProfession ?? '';
    _fatherIncomeCtrl.text = app.fatherAnnualIncome ?? '';
    _fatherPhoneCtrl.text = app.fatherPhoneNo ?? '';

    _fatherEmailCtrl.text = app.fatherEmail ?? '';

    // Mother
    _motherNameCtrl.text = app.motherName ?? '';
    _motherAgeCtrl.text = app.motherAge?.toString() ?? '';
    _motherQualCtrl.text = app.motherQualification ?? '';
    _motherProfCtrl.text = app.motherProfession ?? '';
    _motherIncomeCtrl.text = app.motherAnnualIncome ?? '';
    _motherPhoneCtrl.text = app.motherPhoneNo ?? '';

    _motherEmailCtrl.text = app.motherEmail ?? '';



    // If relationship/guardian fields are relevant, you may decide to prefill them too.
    // Currently we keep guardian fields untouched so the user can explicitly provide them when needed.

    if (mounted) setState(() {});
  }
String? _selectedCategory;
String? _selectedStream;
String? _selectedQualificationLevel;
final List<SubjectInput> _subjectInputs = [];

void _addSubject() {
  setState(() {
    _subjectInputs.add(SubjectInput());
  });
}
// -----------------------
// Latest Qualification
// -----------------------
final _boardUniversityCtrl = TextEditingController();
final _passingYearCtrl = TextEditingController();
final _qualificationPercentageCtrl = TextEditingController();

// -----------------------
// Academic Details
// -----------------------
final List<SubjectMark> _subjects = [];
final _overallPercentageCtrl = TextEditingController();

// -----------------------
// Course Preferences (max 3)
 // -----------------------
  final _vm = ApplicationViewModel();
  final _formKey = GlobalKey<FormState>();
  bool _checkingExisting = true;
  StudentApplication? _application;

  @override
  void initState() {
    super.initState();

    // Run after first frame so context & provider are ready.
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;

      // Case 1: If initialApplication provided, prefill and skip backend call
      if (widget.initialApplication != null) {
        _vm.setApplication(widget.initialApplication);
        _application = widget.initialApplication;
        _populateFromApplication(_application!);
        _checkingExisting = false;
        setState(() {});
        return;
      }

      // Case 2: Force new blank form BUT if user already has saved applications,
      // prefill parent & address sections from the first saved application.
      if (widget.forceNew) {
        // attempt to fetch existing applications (non-blocking for user, but we await here)
        await _checkExisting();

        if (_application != null) {
          // prefill only father, mother and address sections (fields remain editable)
          _prefillParentAndAddress(_application!);
        }

        _checkingExisting = false;
        setState(() {});
        return;
      }

      // Case 3: Normal case — fetch applications list for this student
      await _checkExisting();

      // if we fetched an existing application and want to prefill the form
      if (_application != null) {
        _populateFromApplication(_application!);
      }
    });
  }

  Future<void> _checkExisting() async {
    final studId = getIt<AppStateProvider>().user?.sId;
    if (studId != null && studId.isNotEmpty) {
      final failure = await _vm.getApplicationsByStudId(studId: studId);
      // if single application prefilling is still desired, you can pick the latest:
      if (_vm.applications.isNotEmpty) {
        _application = _vm.applications.first;
      }
    }
    if (mounted) setState(() => _checkingExisting = false);
  }

  void _populateFromApplication(StudentApplication app) {
    // basic fields (add more fields if your model has them)
    _nameCtrl.text = app.name ?? '';
    _locationCtrl.text = app.location ?? '';
    _subjectInputs.clear();

if (app.academicDetails?.subjects != null) {
  for (final s in app.academicDetails!.subjects) {
    final input = SubjectInput();
    input.subjectCtrl.text = s.subjectName;
    input.marksCtrl.text = s.marksObtained.toString();
    input.maxMarksCtrl.text = s.maxMarks.toString();
    _subjectInputs.add(input);
  }
}

    _dobCtrl.text =
        app.dob != null ? app.dob!.toIso8601String().split('T').first : '';
    _gender = app.gender ?? _gender;
    _motherTongueCtrl.text = app.motherTongue ?? '';
    _placeOfBirthCtrl.text = app.placeOfBirth ?? '';

    _nationalityCtrl.text = app.nationality ?? '';
    _selectedCategory = app.category;


  // Latest Qualification
  if (app.latestQualification != null) {
    _selectedQualificationLevel = app.latestQualification!.level;
    _boardUniversityCtrl.text =
        app.latestQualification!.boardOrUniversity;
 
    _qualificationPercentageCtrl.text =
        app.latestQualification!.percentage.toString();
  }

  // Academic Details
  if (app.academicDetails != null) {
    _selectedStream = app.academicDetails!.stream;
    _subjects
      ..clear()
      ..addAll(app.academicDetails!.subjects);
    _overallPercentageCtrl.text =
        app.academicDetails!.overallPercentage?.toString() ?? '';
  }


    _fatherNameCtrl.text = app.fatherName ?? '';
    _fatherAgeCtrl.text = app.fatherAge?.toString() ?? '';
    _fatherQualCtrl.text = app.fatherQualification ?? '';
    _fatherProfCtrl.text = app.fatherProfession ?? '';
    _fatherIncomeCtrl.text = app.fatherAnnualIncome ?? '';
    _fatherPhoneCtrl.text = app.fatherPhoneNo ?? '';
    _fatherEmailCtrl.text = app.fatherEmail ?? '';

    _motherNameCtrl.text = app.motherName ?? '';
    _motherAgeCtrl.text = app.motherAge?.toString() ?? '';
    _motherQualCtrl.text = app.motherQualification ?? '';
    _motherProfCtrl.text = app.motherProfession ?? '';
    _motherIncomeCtrl.text = app.motherAnnualIncome ?? '';
    _motherPhoneCtrl.text = app.motherPhoneNo ?? '';
    _motherEmailCtrl.text = app.motherEmail ?? '';

  

    _yearlyBudgetCtrl.text = app.yearlyBudget ?? '';

    // trigger rebuild so UI reflects values
    if (mounted) setState(() {});
  }

  // -----------------------
  // Student core
  // -----------------------
  final _nameCtrl = TextEditingController();
  final _locationCtrl = TextEditingController();
  final _dobCtrl = TextEditingController(); // yyyy-MM-dd
  String? _gender = 'Male';
  final _motherTongueCtrl = TextEditingController();
  final _placeOfBirthCtrl = TextEditingController();
  final _nationalityCtrl = TextEditingController();
 





  // -----------------------
  // Father
  // -----------------------
  final _fatherNameCtrl = TextEditingController();
  final _fatherAgeCtrl = TextEditingController();
  final _fatherQualCtrl = TextEditingController();
  final _fatherProfCtrl = TextEditingController();
  final _fatherIncomeCtrl = TextEditingController();
  final _fatherPhoneCtrl = TextEditingController();

  final _fatherEmailCtrl = TextEditingController();

  // -----------------------
  // Mother
  // -----------------------
  final _motherNameCtrl = TextEditingController();
  final _motherAgeCtrl = TextEditingController();
  final _motherQualCtrl = TextEditingController();
  final _motherProfCtrl = TextEditingController();
  final _motherIncomeCtrl = TextEditingController();
  final _motherPhoneCtrl = TextEditingController();

  final _motherEmailCtrl = TextEditingController();




  final _yearlyBudgetCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _locationCtrl.dispose();
    _dobCtrl.dispose();
    _motherTongueCtrl.dispose();
    _placeOfBirthCtrl.dispose();
    _nationalityCtrl.dispose();
   
_boardUniversityCtrl.dispose();
_qualificationPercentageCtrl.dispose();
_overallPercentageCtrl.dispose();
    _fatherNameCtrl.dispose();
    _fatherAgeCtrl.dispose();
    _fatherQualCtrl.dispose();
    _fatherProfCtrl.dispose();
    _fatherIncomeCtrl.dispose();
    _fatherPhoneCtrl.dispose();
  
    _fatherEmailCtrl.dispose();

    _motherNameCtrl.dispose();
    _motherAgeCtrl.dispose();
    _motherQualCtrl.dispose();
    _motherProfCtrl.dispose();
    _motherIncomeCtrl.dispose();
    _motherPhoneCtrl.dispose();
   
    _motherEmailCtrl.dispose();

    _yearlyBudgetCtrl.dispose();

    super.dispose();
  }
void _removeSubject(int index) {
  _subjectInputs[index].subjectCtrl.dispose();
  _subjectInputs[index].marksCtrl.dispose();
  _subjectInputs[index].maxMarksCtrl.dispose();

  setState(() {
    _subjectInputs.removeAt(index);
  });
}


  Future<void> _pickDob() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 5, now.month, now.day),
      firstDate: DateTime(now.year - 25),
      lastDate: now,
    );
    if (picked != null) {
      _dobCtrl.text =
          "${picked.year.toString().padLeft(4, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      setState(() {});
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    // Resolve studId from AppStateProvider
    final studId = getIt<AppStateProvider>().user?.sId;
    if (studId == null || studId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Missing logged-in student id.")),
      );
      return;
    }

    // Parse DOB
    DateTime? dob;
    if (_dobCtrl.text.trim().isNotEmpty) {
      dob = DateTime.tryParse(_dobCtrl.text.trim());
      if (dob == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid DOB format. Use yyyy-MM-dd.")),
        );
        return;
      }
    }

    // Parse ints for ages safely
    int? fatherAge = int.tryParse(_fatherAgeCtrl.text.trim());
    int? motherAge = int.tryParse(_motherAgeCtrl.text.trim());
final coursePreferences = _coursePrefs
    .where((e) => e.courseName.trim().isNotEmpty)
    .toList();

final latestQualification = LatestQualification(
  level: _selectedQualificationLevel!,
  boardOrUniversity: _boardUniversityCtrl.text.trim(),
  percentage: double.parse(_qualificationPercentageCtrl.text.trim()),
);
final academicDetails = AcademicDetails(
  stream: _selectedStream!,
  subjects: _subjects,
  overallPercentage: _overallPercentageCtrl.text.isEmpty
      ? null
      : double.parse(_overallPercentageCtrl.text.trim()),
);

    final payload = StudentApplication(
      studId: studId,
      // student core
      name: _nameCtrl.text.trim(),
      location: _locationCtrl.text.trim(),
      dob: dob,
      gender: _gender,
      motherTongue: _motherTongueCtrl.text.trim(),
  category: _selectedCategory!,
  coursePreferences: coursePreferences,
  latestQualification: latestQualification,
  academicDetails: academicDetails,
      placeOfBirth:
          _placeOfBirthCtrl.text.trim().isEmpty
              ? null
              : _placeOfBirthCtrl.text.trim(),
     
      nationality: _nationalityCtrl.text.trim(),
    
      // father
      fatherName: _fatherNameCtrl.text.trim(),
      fatherAge: fatherAge,
      fatherQualification: _fatherQualCtrl.text.trim(),
      fatherProfession: _fatherProfCtrl.text.trim(),
      fatherAnnualIncome: _fatherIncomeCtrl.text.trim(),
      fatherPhoneNo: _fatherPhoneCtrl.text.trim(),
  
      fatherEmail: _fatherEmailCtrl.text.trim(),

      // mother
      motherName: _motherNameCtrl?.text.trim(),
      motherAge: motherAge,
      motherQualification: _motherQualCtrl.text.trim(),
      motherProfession: _motherProfCtrl.text.trim(),
      motherAnnualIncome: _motherIncomeCtrl.text.trim(),
      motherPhoneNo: _motherPhoneCtrl.text.trim(),
      motherEmail: _motherEmailCtrl.text.trim(),

    
      yearlyBudget: _yearlyBudgetCtrl.text.trim(),
    );
    final failure = await _vm.addApplication(payload);
    if (!mounted) return;

    if (failure != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(failure.message ?? "Something went wrong")),
      );
      return;
    }
_subjects.clear();

for (final s in _subjectInputs) {
  _subjects.add(
    SubjectMark(
      subjectName: s.subjectCtrl.text.trim(),
      marksObtained: double.parse(s.marksCtrl.text.trim()),
      maxMarks: double.parse(s.maxMarksCtrl.text.trim()),
    ),
  );
}
    // Try to get the created application id from the returned model
    final created = _vm.application;
    String createdAppId = created?.applicationId?.toString() ?? '';

    // Debug log for visibility
    debugPrint('[ApplicationFormView] vm.application after add: $created');
    debugPrint(
      '[ApplicationFormView] initial createdAppId="$createdAppId" studId="$studId"',
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Application submitted successfully!")),
    );

    // If the backend didn't return applicationId, fetch user's applications as a fallback
    if (createdAppId.isEmpty) {
      try {
        debugPrint(
          '[ApplicationFormView] createdAppId empty. Fetching applications for studId: $studId',
        );

        // ensure studId exists
        if (studId != null && studId.isNotEmpty) {
          final fallbackFailure = await _vm.getApplicationsByStudId(
            studId: studId,
          );

          if (fallbackFailure != null) {
            debugPrint(
              '[ApplicationFormView] getApplicationsByStudId failed: ${fallbackFailure.message}',
            );
          } else {
            if (_vm.applications.isNotEmpty) {
              final mostRecent = _vm.applications.first;
              createdAppId =
                  mostRecent.applicationId?.toString() ??
                  mostRecent.applicationId?.toString() ??
                  mostRecent.applicationId?.toString() ??
                  '';
              debugPrint(
                '[ApplicationFormView] fallback found createdAppId="$createdAppId" from applications list',
              );
            } else {
              debugPrint(
                '[ApplicationFormView] fallback: no applications returned for studId',
              );
            }
          }
        } else {
          debugPrint(
            '[ApplicationFormView] studId missing; cannot run fallback fetch',
          );
        }
      } catch (e, st) {
        debugPrint(
          '[ApplicationFormView] exception during fallback fetch: $e\n$st',
        );
      }
    }

    // Now attempt PDF generation if we have an applicationId
    if (createdAppId.isNotEmpty && studId != null && studId.isNotEmpty) {
      try {
        final StudentPdfViewModel pdfVm =
            getIt.isRegistered<StudentPdfViewModel>()
                ? getIt<StudentPdfViewModel>()
                : StudentPdfViewModel();

        debugPrint(
          '[ApplicationFormView] calling pdfVm.generate(studId=$studId, applicationId=$createdAppId)',
        );

        final pdfFailure = await pdfVm.generate(
          context: context,
          studId: studId,
          applicationId: createdAppId,
        );

        if (pdfFailure != null) {
          debugPrint(
            '[ApplicationFormView] PDF generation failed: ${pdfFailure.message}',
          );
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(pdfFailure.message ?? "PDF generation failed"),
              ),
            );
          }
        } else {
          debugPrint(
            '[ApplicationFormView] PDF generated successfully for applicationId=$createdAppId',
          );
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("PDF generated successfully!")),
            );
          }
        }
      } catch (e, st) {
        debugPrint(
          '[ApplicationFormView] Exception during pdf generation: $e\n$st',
        );
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("PDF generation encountered an error."),
            ),
          );
        }
      }
    } else {
      debugPrint(
        '❌ Skipping PDF generation — missing createdAppId or studId. createdAppId="$createdAppId", studId="$studId"',
      );
    }

    // navigate to success page regardless (you can change this if you want to wait for PDF)
    if (!mounted) return;

    context.pushNamed(
      RouteNames.applicationSuccess,
      extra: {'applicationId': createdAppId},
    );
  }
static const categoryOptions = ['General', 'OBC', 'SC', 'ST', 'EWS'];

static const streamOptions = [
  'PCM',
  'PCB',
  'PCMB',
  'Arts',
  'Commerce',
  'Other',
];

static const qualificationLevelOptions = [
  '10th',
  '12th',
  'Diploma',
  'UG',
  'PG',
];
final List<CoursePreference> _coursePrefs = [
  CoursePreference(priority: 1, courseName: ''),
  CoursePreference(priority: 2, courseName: ''),
  CoursePreference(priority: 3, courseName: ''),
];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _vm,
      child: Consumer<ApplicationViewModel>(
        builder: (_, vm, __) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: SAppBar(
              title: "Application Form",
              leading: SIcon(
                icon: Icons.keyboard_arrow_left,
                onTap: () => context.pop(),
              ),
            ),

            body:
                _checkingExisting
                    ? const Center(child: SLoadingIndicator())
                    : (vm.applications.isNotEmpty && !widget.forceNew)
                    ? _AlreadyFilledMessage(applications: vm.applications)
                    : SafeArea(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // ---------------- Student ----------------
                              Text(
                                "Student Details",
                                style: STextStyles.s18W600.copyWith(
                                  color: SColor.secTextColor,
                                ),
                              ),
                              const SizedBox(height: 10),
                              _input("Full Name", _nameCtrl, req: true),
                            const SizedBox(height: 8,),
                              _input("Location", _locationCtrl, req: true),
                              _dateInput(
                                "DOB (yyyy-MM-dd)",
                                _dobCtrl,
                                onPick: _pickDob,
                                req: true,
                              ),
                              _dropdown<String>(
                                label: "Gender",
                                value: _gender,
                                items: const ["Male", "Female", "Other"],
                                onChanged: (v) => setState(() => _gender = v),
                              ),
                              SizedBox(height: 10,),
                              const SizedBox(height: 20),
Text(
  "Latest Qualification",
  style: STextStyles.s18W600.copyWith(color: SColor.secTextColor),
),
const SizedBox(height: 10),

// Qualification Level (Dropdown)
DropdownButtonFormField<String>(
  value: _selectedQualificationLevel,
  decoration: const InputDecoration(
    labelText: 'Qualification Level',
    border: OutlineInputBorder(),
  ),
  items: qualificationLevelOptions

      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
      .toList(),
  onChanged: (v) => setState(() => _selectedQualificationLevel = v),
  validator: (v) => v == null ? 'Qualification required' : null,
),

const SizedBox(height: 10),

// Board / University
TextFormField(
  controller: _boardUniversityCtrl,
  decoration: const InputDecoration(
    labelText: 'Board / University',
    border: OutlineInputBorder(),
  ),
  validator: (v) =>
      v == null || v.trim().isEmpty ? 'Required' : null,
),

const SizedBox(height: 10),

// Passing Year
TextFormField(
  controller: _passingYearCtrl,
  keyboardType: TextInputType.number,
  decoration: const InputDecoration(
    labelText: 'Passing Year',
    border: OutlineInputBorder(),
  ),
  validator: (v) {
    if (v == null || v.isEmpty) return 'Required';
    final year = int.tryParse(v);
    if (year == null || year < 1980 || year > DateTime.now().year) {
      return 'Enter valid year';
    }
    return null;
  },
),

const SizedBox(height: 10),

// Percentage
TextFormField(
  controller: _qualificationPercentageCtrl,
  keyboardType: const TextInputType.numberWithOptions(decimal: true),
  decoration: const InputDecoration(
    labelText: 'Percentage',
    border: OutlineInputBorder(),
  ),
  validator: (v) {
    if (v == null || v.isEmpty) return 'Required';
    final val = double.tryParse(v);
    if (val == null || val < 0 || val > 100) {
      return 'Enter valid percentage';
    }
    return null;
  },
),

                              DropdownButtonFormField<String>(
  value: _selectedStream,
  decoration: const InputDecoration(
    labelText: 'Stream',
    border: OutlineInputBorder(),
  ),
  items: streamOptions
      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
      .toList(),
  onChanged: (v) => setState(() => _selectedStream = v),
  validator: (v) => v == null ? 'Stream required' : null,
),
SizedBox(height: 15),
const SizedBox(height: 20),
Text(
  "Academic Details",
  style: STextStyles.s18W600.copyWith(color: SColor.secTextColor),
),

const SizedBox(height: 10),

..._subjectInputs.asMap().entries.map((entry) {
  final index = entry.key;
  final item = entry.value;

  return Card(
    color: Colors.white,
    margin: const EdgeInsets.symmetric(vertical: 6),
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          TextFormField(
            controller: item.subjectCtrl,
            decoration: const InputDecoration(
              labelText: "Subject Name",
              border: OutlineInputBorder(),
            ),
            validator: (v) =>
                v == null || v.isEmpty ? 'Required' : null,
          ),
          const SizedBox(height: 8),

          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: item.marksCtrl,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Marks Obtained",
                    border: OutlineInputBorder(),
                  ),
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Required' : null,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextFormField(
                  controller: item.maxMarksCtrl,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Max Marks",
                    border: OutlineInputBorder(),
                  ),
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Required' : null,
                ),
              ),
            ],
          ),

          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _removeSubject(index),
            ),
          ),
        ],
      ),
    ),
  );
}).toList(),

TextButton.icon(
  onPressed: _addSubject,
  icon: const Icon(Icons.add),
  label: const Text("Add Subject"),
),

const SizedBox(height: 12),
ListView.builder(
  shrinkWrap: true,
  physics: NeverScrollableScrollPhysics(),
  itemCount: 3,
  itemBuilder: (context, i) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Course Preference ${i + 1}',
      ),
      onChanged: (v) {
        _coursePrefs[i] =
            CoursePreference(priority: i + 1, courseName: v);
      },
      validator: (v) =>
          v == null || v.isEmpty ? 'Required' : null,
    );
  },
),
SizedBox(height: 10,),
TextFormField(
  controller: _overallPercentageCtrl,
  keyboardType: TextInputType.number,
  decoration: const InputDecoration(
    labelText: "Overall Percentage (optional)",
    border: OutlineInputBorder(),
  ),
),
SizedBox(height: 15,),
DropdownButtonFormField<String>(
  value: _selectedCategory,
  decoration: const InputDecoration(
    labelText: 'Category',
    border: OutlineInputBorder(),
  ),
  items: categoryOptions
      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
      .toList(),
  onChanged: (v) => setState(() => _selectedCategory = v),
  validator: (v) => v == null ? 'Category required' : null,
),
SizedBox(height: 15),

SizedBox(height: 15),

                              _input("Mother Tongue", _motherTongueCtrl),
                              _input(
                                "Place of Birth (optional)",
                                _placeOfBirthCtrl,
                              ),
                              // Specially abled switch + type
                             
                              _input(
                                "Nationality",
                                _nationalityCtrl,
                                req: true,
                              ),
                         

                              const SizedBox(height: 16),
                              // ---------------- Last School ----------------
                           
                              const SizedBox(height: 8),
                            

                              const SizedBox(height: 16),
                              // ---------------- Father ----------------
                              Text(
                                "Father Details",
                                style: STextStyles.s18W600.copyWith(
                                  color: SColor.secTextColor,
                                ),
                              ),
                              const SizedBox(height: 8),
                              _input("Name", _fatherNameCtrl, req: true),
                              _input(
                                "Age",
                                _fatherAgeCtrl,
                                keyboard: TextInputType.number,
                              ),
                              _input("Qualification", _fatherQualCtrl),
                              _input("Profession", _fatherProfCtrl),
                              _input("Annual Income", _fatherIncomeCtrl),
                              _input(
                                "Phone No",
                                _fatherPhoneCtrl,
                                keyboard: TextInputType.phone,
                              ),
                             
                              _input(
                                "Email",
                                _fatherEmailCtrl,
                                keyboard: TextInputType.emailAddress,
                              ),

                              const SizedBox(height: 16),
                              // ---------------- Mother ----------------
                              Text(
                                "Mother Details",
                                style: STextStyles.s18W600.copyWith(
                                  color: SColor.secTextColor,
                                ),
                              ),
                              const SizedBox(height: 8),
                              _input("Name", _motherNameCtrl, req: true),
                              _input(
                                "Age",
                                _motherAgeCtrl,
                                keyboard: TextInputType.number,
                              ),
                              _input("Qualification", _motherQualCtrl),
                              _input("Profession", _motherProfCtrl),
                              _input("Annual Income", _motherIncomeCtrl),
                              _input(
                                "Phone No",
                                _motherPhoneCtrl,
                                keyboard: TextInputType.phone,
                              ),
                              _input(
                                "Email",
                                _motherEmailCtrl,
                                keyboard: TextInputType.emailAddress,
                              ),

                              const SizedBox(height: 16),
                              // ---------------- Relationship & Guardian ----------------
                              Text(
                                "Family & Address",
                                style: STextStyles.s18W600.copyWith(
                                  color: SColor.secTextColor,
                                ),
                              ),
                              const SizedBox(height: 8),
                            

                          
                      
                              // ---------------- Other ----------------
                              Text(
                                "Other Info",
                                style: STextStyles.s18W600.copyWith(
                                  color: SColor.secTextColor,
                                ),
                              ),
                              const SizedBox(height: 8),
                            
                              _input(
                                "Yearly Budget",
                                _yearlyBudgetCtrl,
                                
                              ),

                              const SizedBox(height: 24),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: _submit,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: SColor.primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                    ),
                                  ),
                                  child: Text(
                                    "Submit Application",
                                    style: STextStyles.s16W600.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
          );
        },
      ),
    );
  }

  // ---------- UI helpers ----------


  Widget _input(
    String label,
    TextEditingController controller, {
    bool req = false,
    int maxLines = 1,
    TextInputType? keyboard,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboard,
        maxLines: maxLines,
        validator: (v) {
          if (req && (v == null || v.trim().isEmpty)) {
            return '$label is required';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
        ),
      ),
    );
  }

  Widget _dateInput(
    String label,
    TextEditingController controller, {
    required VoidCallback onPick,
    bool req = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        readOnly: true,
        validator: (v) {
          if (req && (v == null || v.trim().isEmpty)) {
            return '$label is required';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: label,
          suffixIcon: IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: onPick,
          ),
          border: const OutlineInputBorder(),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
        ),
      ),
    );
  }

  Widget _dropdown<T>({
    required String label,
    required T? value,
    required List<T> items,
    required ValueChanged<T?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 4,
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<T>(
            value: value,
            isExpanded: true,
            items:
                items
                    .map(
                      (e) => DropdownMenuItem<T>(
                        value: e,
                        child: Text(e.toString()),
                      ),
                    )
                    .toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
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

class SubjectInput {
  TextEditingController subjectCtrl;
  TextEditingController marksCtrl;
  TextEditingController maxMarksCtrl;

  SubjectInput()
      : subjectCtrl = TextEditingController(),
        marksCtrl = TextEditingController(),
        maxMarksCtrl = TextEditingController();
}
