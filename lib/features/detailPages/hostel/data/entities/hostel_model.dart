class HostelModel {
  final String id;
  final String hostelName;
  final String type;
  final int capacity;
  final int availableSeats;
  final int feePerYear;
  final List<String> facilities;
  final String? rules;

  HostelModel({
    required this.id,
    required this.hostelName,
    required this.type,
    required this.capacity,
    required this.availableSeats,
    required this.feePerYear,
    required this.facilities,
    this.rules,
  });

  factory HostelModel.fromJson(Map<String, dynamic> json) {
    return HostelModel(
      id: json['_id'],
      hostelName: json['hostelName'],
      type: json['type'],
      capacity: json['capacity'],
      availableSeats: json['availableSeats'],
      feePerYear: json['feePerYear'],
      facilities: List<String>.from(json['facilities'] ?? []),
      rules: json['rules'],
    );
  }
}
