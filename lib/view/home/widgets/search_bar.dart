import 'package:flutter/material.dart';
import 'package:travel_app/view/home/widgets/guest_selector.dart';

import '../../../core/theme.dart';

class SearchBars extends StatelessWidget {
  const SearchBars({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        // Location, Date and Guests Input
        TextField(
          decoration: InputDecoration(
            labelText: 'Location',
            filled: true,
            prefixIcon: const Icon(
              Icons.search,
              color: AppTheme.iconColor,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            suffixIcon: const Icon(Icons.settings_outlined),
          ),
        ),
        const SizedBox(height: 15),
        TextField(
          decoration: InputDecoration(
            filled: true,
            labelText: "July 08 - July 15",
            prefixIcon: const Icon(
              Icons.calendar_today,
              color: AppTheme.iconColor,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 15),
        const GuestSelector(),
        const SizedBox(height: 15),
        Center(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(),
            child: const Text("Search"),
          ),
        ),
      ],
    );
  }
}
