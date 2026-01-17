class ScholarshipModel {
  final String? id;
  final String? name;
  final int? amount;
  final String? type;
  final List<String> documentsRequired;

  ScholarshipModel({
    this.id,
    this.name,
    this.amount,
    this.type,
    this.documentsRequired = const [],
  });

  factory ScholarshipModel.fromJson(Map<String, dynamic> json) {
    return ScholarshipModel(
      id: json['_id'],
      name: json['name'],
      amount: json['amount'],
      type: json['type'],
      documentsRequired:
          (json['documentsRequired'] as List<dynamic>?)
                  ?.map((e) => e.toString())
                  .toList() ??
              [],
    );
  }
}
