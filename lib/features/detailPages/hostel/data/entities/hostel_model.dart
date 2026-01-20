// features/detailPages/hostel/data/entities/hostel_model.dart

class HostelModel {
  final String id;
  final String hostelName;
  final String type; // Boys / Girls / Both
  final int capacity;
  final bool acAvailable;
  final bool messAvailable;
  final int? annualFee;

  HostelModel({
    required this.id,
    required this.hostelName,
    required this.type,
    required this.capacity,
    required this.acAvailable,
    required this.messAvailable,
    this.annualFee,
  });

  factory HostelModel.fromJson(Map<String, dynamic> json) {
    return HostelModel(
      id: json['_id'],
      hostelName: json['hostelName'],
      type: json['type'],
      capacity: json['capacity'],
      acAvailable: json['acAvailable'],
      messAvailable: json['messAvailable'],
      annualFee: json['annualFee'],
    );
  }
}
