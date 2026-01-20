import 'dart:convert';

class StudentApplication {
  final String? applicationId;
  final String? studId;

  // Core
  final String? name;
  final String? location;
  final DateTime? dob;
  final int? age;
  final String? gender;
  final String? motherTongue;
  final String? placeOfBirth;
  final bool? speciallyAbled;
  final String? speciallyAbledType;
  final String? nationality;
  final String? category;

  // Parent details
  final String? fatherName;
  final int? fatherAge;
  final String? fatherQualification;
  final String? fatherProfession;
  final String? fatherAnnualIncome;
  final String? fatherPhoneNo;
  final String? fatherEmail;

  final String? motherName;
  final int? motherAge;
  final String? motherQualification;
  final String? motherProfession;
  final String? motherAnnualIncome;
  final String? motherPhoneNo;
  final String? motherEmail;

  final String? yearlyBudget;

  // College application data
  final List<CoursePreference>? coursePreferences;
  final LatestQualification? latestQualification;
  final AcademicDetails? academicDetails;

  final DateTime? createdAt;
  final DateTime? updatedAt;

  StudentApplication({
    this.applicationId,
    this.studId,
    this.name,
    this.location,
    this.dob,
    this.age,
    this.gender,
    this.motherTongue,
    this.placeOfBirth,
    this.speciallyAbled,
    this.speciallyAbledType,
    this.nationality,
    this.category,
    this.fatherName,
    this.fatherAge,
    this.fatherQualification,
    this.fatherProfession,
    this.fatherAnnualIncome,
    this.fatherPhoneNo,
    this.fatherEmail,
    this.motherName,
    this.motherAge,
    this.motherQualification,
    this.motherProfession,
    this.motherAnnualIncome,
    this.motherPhoneNo,
    this.motherEmail,
    this.yearlyBudget,
    this.coursePreferences,
    this.latestQualification,
    this.academicDetails,
    this.createdAt,
    this.updatedAt,
  });

  /// ✅ COPY WITH (FIXES YOUR ERROR)
  StudentApplication copyWith({
    String? applicationId,
    String? studId,
    String? name,
    String? location,
    DateTime? dob,
    int? age,
    String? gender,
    String? motherTongue,
    String? placeOfBirth,
    bool? speciallyAbled,
    String? speciallyAbledType,
    String? nationality,
    String? category,
    String? fatherName,
    int? fatherAge,
    String? fatherQualification,
    String? fatherProfession,
    String? fatherAnnualIncome,
    String? fatherPhoneNo,
    String? fatherEmail,
    String? motherName,
    int? motherAge,
    String? motherQualification,
    String? motherProfession,
    String? motherAnnualIncome,
    String? motherPhoneNo,
    String? motherEmail,
    String? yearlyBudget,
    List<CoursePreference>? coursePreferences,
    LatestQualification? latestQualification,
    AcademicDetails? academicDetails,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return StudentApplication(
      applicationId: applicationId ?? this.applicationId,
      studId: studId ?? this.studId,
      name: name ?? this.name,
      location: location ?? this.location,
      dob: dob ?? this.dob,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      motherTongue: motherTongue ?? this.motherTongue,
      placeOfBirth: placeOfBirth ?? this.placeOfBirth,
      speciallyAbled: speciallyAbled ?? this.speciallyAbled,
      speciallyAbledType: speciallyAbledType ?? this.speciallyAbledType,
      nationality: nationality ?? this.nationality,
      category: category ?? this.category,
      fatherName: fatherName ?? this.fatherName,
      fatherAge: fatherAge ?? this.fatherAge,
      fatherQualification: fatherQualification ?? this.fatherQualification,
      fatherProfession: fatherProfession ?? this.fatherProfession,
      fatherAnnualIncome: fatherAnnualIncome ?? this.fatherAnnualIncome,
      fatherPhoneNo: fatherPhoneNo ?? this.fatherPhoneNo,
      fatherEmail: fatherEmail ?? this.fatherEmail,
      motherName: motherName ?? this.motherName,
      motherAge: motherAge ?? this.motherAge,
      motherQualification: motherQualification ?? this.motherQualification,
      motherProfession: motherProfession ?? this.motherProfession,
      motherAnnualIncome: motherAnnualIncome ?? this.motherAnnualIncome,
      motherPhoneNo: motherPhoneNo ?? this.motherPhoneNo,
      motherEmail: motherEmail ?? this.motherEmail,
      yearlyBudget: yearlyBudget ?? this.yearlyBudget,
      coursePreferences: coursePreferences ?? this.coursePreferences,
      latestQualification: latestQualification ?? this.latestQualification,
      academicDetails: academicDetails ?? this.academicDetails,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory StudentApplication.fromJson(Map<String, dynamic> json) {
    return StudentApplication(
      applicationId: json['_id']?.toString(),
      studId: json['studId']?.toString(),
      name: json['name'],
      location: json['location'],
      dob: json['dob'] != null ? DateTime.tryParse(json['dob']) : null,
      age: json['age'],
      gender: json['gender'],
      motherTongue: json['motherTongue'],
      placeOfBirth: json['placeOfBirth'],
      speciallyAbled: json['speciallyAbled'],
      speciallyAbledType: json['speciallyAbledType'],
      nationality: json['nationality'],
      category: json['category'],
      fatherName: json['fatherName'],
      fatherAge: json['fatherAge'],
      fatherQualification: json['fatherQualification'],
      fatherProfession: json['fatherProfession'],
      fatherAnnualIncome: json['fatherAnnualIncome'],
      fatherPhoneNo: json['fatherPhoneNo'],
      fatherEmail: json['fatherEmail'],
      motherName: json['motherName'],
      motherAge: json['motherAge'],
      motherQualification: json['motherQualification'],
      motherProfession: json['motherProfession'],
      motherAnnualIncome: json['motherAnnualIncome'],
      motherPhoneNo: json['motherPhoneNo'],
      motherEmail: json['motherEmail'],
      yearlyBudget: json['yearlyBudget'],
      coursePreferences: (json['coursePreferences'] as List?)
          ?.map((e) => CoursePreference.fromJson(e))
          .toList(),
      latestQualification: json['latestQualification'] != null
          ? LatestQualification.fromJson(json['latestQualification'])
          : null,
      academicDetails: json['academicDetails'] != null
          ? AcademicDetails.fromJson(json['academicDetails'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "studId": studId,
      "name": name,
      "location": location,
      "dob": dob?.toIso8601String(),
      "age": age,
      "gender": gender,
      "motherTongue": motherTongue,
      "placeOfBirth": placeOfBirth,
      "speciallyAbled": speciallyAbled,
      "speciallyAbledType": speciallyAbledType,
      "nationality": nationality,
      "category": category,
      "fatherName": fatherName,
      "fatherAge": fatherAge,
      "fatherQualification": fatherQualification,
      "fatherProfession": fatherProfession,
      "fatherAnnualIncome": fatherAnnualIncome,
      "fatherPhoneNo": fatherPhoneNo,
      "fatherEmail": fatherEmail,
      "motherName": motherName,
      "motherAge": motherAge,
      "motherQualification": motherQualification,
      "motherProfession": motherProfession,
      "motherAnnualIncome": motherAnnualIncome,
      "motherPhoneNo": motherPhoneNo,
      "motherEmail": motherEmail,
      "yearlyBudget": yearlyBudget,
      "coursePreferences":
          coursePreferences?.map((e) => e.toJson()).toList(),
      "latestQualification": latestQualification?.toJson(),
      "academicDetails": academicDetails?.toJson(),
    };
  }

  static StudentApplication fromJsonStr(String source) =>
      StudentApplication.fromJson(json.decode(source));

  String toJsonStr() => json.encode(toJson());
}

class SubjectMark {
  final String subjectName;
  final double marksObtained;
  final double maxMarks;

  SubjectMark({
    required this.subjectName,
    required this.marksObtained,
    required this.maxMarks,
  });

  factory SubjectMark.fromJson(Map<String, dynamic> json) {
    return SubjectMark(
      subjectName: json['subjectName'],
      marksObtained: (json['marksObtained'] as num).toDouble(),
      maxMarks: (json['maxMarks'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "subjectName": subjectName,
      "marksObtained": marksObtained,
      "maxMarks": maxMarks,
    };
  }
}
class AcademicDetails {
  final String stream;
  final List<SubjectMark> subjects;
  final double? overallPercentage;

  AcademicDetails({
    required this.stream,
    required this.subjects,
    this.overallPercentage,
  });

  factory AcademicDetails.fromJson(Map<String, dynamic> json) {
    return AcademicDetails(
      stream: json['stream'],
      subjects: (json['subjects'] as List)
          .map((e) => SubjectMark.fromJson(e))
          .toList(),
      overallPercentage: json['overallPercentage'] != null
          ? (json['overallPercentage'] as num).toDouble()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "stream": stream,
      "subjects": subjects.map((e) => e.toJson()).toList(),
      "overallPercentage": overallPercentage,
    };
  }
}
class LatestQualification {
  final String level;
  final String boardOrUniversity;
  final int passingYear;
  final double percentage;

  LatestQualification({
    required this.level,
    required this.boardOrUniversity,
    required this.passingYear,
    required this.percentage,
  });

  factory LatestQualification.fromJson(Map<String, dynamic> json) {
    return LatestQualification(
      level: json['level'],
      boardOrUniversity: json['boardOrUniversity'],
      passingYear: json['passingYear'],
      percentage: (json['percentage'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "level": level,
      "boardOrUniversity": boardOrUniversity,
      "passingYear": passingYear,
      "percentage": percentage,
    };
  }
}
class CoursePreference {
  final int priority;
  final String courseName;

  CoursePreference({
    required this.priority,
    required this.courseName,
  });

  factory CoursePreference.fromJson(Map<String, dynamic> json) {
    return CoursePreference(
      priority: json['priority'],
      courseName: json['courseName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "priority": priority,
      "courseName": courseName,
    };
  }
}
