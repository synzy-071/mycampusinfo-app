import 'package:mycampusinfo_app/core/network/typedef.dart';
import 'package:mycampusinfo_app/features/application/forms/data/entities/form.dart';

abstract class FormDataSource {
  ResultFuture<List<Form>?> getStudentForms();

  ResultFuture<List<Form>?> trackForm({required String formId});

  ResultFuture<Form?> getFormById({required String formId});

  // now requires formId
  ResultFuture<Form?> submitForm({
    required String applicationId,
    required String collegeId,
    required String formId,
    required int amount,
  });
}
