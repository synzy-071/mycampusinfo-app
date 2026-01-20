// features/detailPages/hostel/presentation/views/hostel_view.dart

import 'package:flutter/material.dart';
import 'package:mycampusinfo_app/common/theme/s_colors.dart';
import 'package:mycampusinfo_app/features/detailPages/hostel/presentation/view_models/hostel_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../common/widgets/s_loading_indicator.dart';
import '../../../../core/common/index.dart';

class HostelView extends StatefulWidget {
  const HostelView({super.key, required this.collegeId});
  final String collegeId;

  @override
  State<HostelView> createState() => _HostelViewState();
}

class _HostelViewState extends State<HostelView> {
  final HostelViewModel hostelViewModel = HostelViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      hostelViewModel.getHostelsByCollegeId(collegeId: widget.collegeId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: hostelViewModel,
      child: Consumer<HostelViewModel>(
        builder: (context, vm, _) {
          if (vm.viewState == ViewState.busy) {
            return const Center(child: SLoadingIndicator());
          }

          final hostels = vm.hostels;

          if (hostels == null || hostels.isEmpty) {
            return const Center(child: Text('No hostel data available'));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: hostels.length,
            separatorBuilder: (_, __) => const SizedBox(height: 14),
            itemBuilder: (_, i) {
              final hostel = hostels[i];

              return Card(
                elevation: 4,
                   color: SColor.backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.amber.shade300),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child:Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      hostel.hostelName,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    const SizedBox(height: 6),

    _infoRow('Type', hostel.type),
    _infoRow('Capacity', hostel.capacity.toString()),
    _infoRow('Available Seats', hostel.availableSeats.toString()),
    _infoRow('Fee / Year', '₹${hostel.feePerYear}'),
    _infoRow('Facilities', hostel.facilities.join(', ')),

    if (hostel.rules != null) ...[
      const SizedBox(height: 6),
      Text(
        'Rules: ${hostel.rules}',
        style: TextStyle(
          fontSize: 13,
          color: Colors.grey.shade700,
        ),
      ),
    ],
  ],
)

                ),
              );
            },
          );
        },
      ),
    );
  }

Widget _infoRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.only(top: 6),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120, // fixed width for labels
          child: Text(
            label,
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w600),
            softWrap: true,
          ),
        ),
      ],
    ),
  );
}

}
