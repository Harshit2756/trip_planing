import 'package:flutter/material.dart';
import 'package:travel_app/core/theme.dart';

class GuestSelector extends StatelessWidget {
  final int _guestCount = 2;

  const GuestSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.person,
            color: AppTheme.iconColor,
          ),
          const SizedBox(width: 8),
          Text(
            '$_guestCount Guests',
            style: const TextStyle(fontSize: 18),
          ),
          const Spacer(),
          const SizedBox(width: 16),
          IconButton(
            icon: const Icon(Icons.remove),
            iconSize: 24,
            onPressed: () {},
          ),
          const Text(
            "|",
            style: TextStyle(fontSize: 24),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
            iconSize: 24,
          ),
        ],
      ),
    );
  }
}
