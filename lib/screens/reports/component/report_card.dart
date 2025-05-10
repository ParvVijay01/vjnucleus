import 'package:flutter/material.dart';

class MockTestCard extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String totalParticipants;
  final String maxMarks;
  final String startTime;
  final String endTime;
  final VoidCallback onViewResult;

  const MockTestCard({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.totalParticipants,
    required this.maxMarks,
    required this.startTime,
    required this.endTime,
    required this.onViewResult,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF2A9D8F),
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Body
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // First row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _infoColumn('Total\nParticipants:', totalParticipants),
                    _infoColumn('Max Marks:', maxMarks),
                    _infoColumn('Date:', date),
                  ],
                ),
                const SizedBox(height: 16),

                // Second row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _infoColumn('Start Time:', startTime),
                    _infoColumn('End Time:', endTime),
                    const SizedBox(width: 80), // To balance spacing
                  ],
                ),
                const SizedBox(height: 20),

                // Button
                ElevatedButton(
                  onPressed: onViewResult,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2A9D8F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    'View Result',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
