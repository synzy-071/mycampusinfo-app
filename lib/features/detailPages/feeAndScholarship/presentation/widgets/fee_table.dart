import 'package:flutter/material.dart';
import 'package:mycampusinfo_app/common/theme/s_colors.dart';
import 'package:mycampusinfo_app/features/detailPages/feeAndScholarship/data/entities/fees_model.dart';

class FeesTable extends StatelessWidget {
  final List<ClassFeeModel> fees;
  final double? transparency;
  final Color colors;

  const FeesTable({
    required this.fees,
    required this.transparency,
    required this.colors,
  });

  static const double _courseColWidth = 100;
  static const double _feeColWidth = 80;

  @override
  Widget build(BuildContext context) {
    if (fees.isEmpty) {
      return const Text('Fee data not available');
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 🟡 Fee Transparency Card
        if (transparency != null)
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: SColor.borderColor),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Fee Transparency Score',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '${transparency!.toStringAsFixed(0)}%',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: transparency! / 100,
                      minHeight: 12,
                      backgroundColor: Colors.yellow.shade100,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),

        const SizedBox(height: 16),

        /// 🟡 Horizontally Scrollable Fees Table
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Colors.black),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_header(), ...fees.map(_row)],
            ),
          ),
        ),
      ],
    );
  }

  /// ================= HEADER =================
  Widget _header() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.yellow.shade50,
        border: const Border(bottom: BorderSide(color: Colors.amber)),
      ),
      child: Row(
        children: const [
          _HCell('Course', width: _courseColWidth),
          _HCell('Tuition', width: _feeColWidth, right: true),
          _HCell('Activity', width: _feeColWidth, right: true),
          _HCell('Transport', width: _feeColWidth, right: true),
          _HCell('Hostel', width: _feeColWidth, right: true),
          _HCell('Misc', width: _feeColWidth, right: true),
          _HCell('Total', width: _feeColWidth, right: true),
        ],
      ),
    );
  }

  /// ================= ROW =================
  Widget _row(ClassFeeModel fee) {
    final tuition = fee.tuition ?? 0;
    final activity = fee.activity ?? 0;
    final transport = fee.transport ?? 0;
    final hostel = fee.hostel ?? 0;
    final misc = fee.misc ?? 0;
    final total = tuition + activity + transport + hostel + misc;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black45)),
      ),
      child: Row(
        children: [
          _Cell(fee.courseName ?? '-', width: _courseColWidth),
          _Cell('₹$tuition', width: _feeColWidth, right: true),
          _Cell('₹$activity', width: _feeColWidth, right: true),
          _Cell('₹$transport', width: _feeColWidth, right: true),
          _Cell('₹$hostel', width: _feeColWidth, right: true),
          _Cell('₹$misc', width: _feeColWidth, right: true),
          _Cell('₹$total', width: _feeColWidth, right: true, bold: true),
        ],
      ),
    );
  }
}

/// ================= CELLS =================

class _HCell extends StatelessWidget {
  final String text;
  final double width;
  final bool right;

  const _HCell(this.text, {required this.width, this.right = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        textAlign: right ? TextAlign.right : TextAlign.left,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _Cell extends StatelessWidget {
  final String text;
  final double width;
  final bool right;
  final bool bold;

  const _Cell(
    this.text, {
    required this.width,
    this.right = false,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        textAlign: right ? TextAlign.right : TextAlign.left,
        style: TextStyle(
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
