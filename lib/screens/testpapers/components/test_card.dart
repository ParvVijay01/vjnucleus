import 'package:flutter/material.dart';

class TestCard extends StatelessWidget {
  final String title;
  final String description;
  final String positiveMarks;
  final String negativeMarks;
  final String instruction;
  final String className;
  final String batch;
  final String accessibility;
  final String date;
  final String time;
  final String duration;
  final bool isPremium;
  

  const TestCard({
    super.key,
    required this.title,
    required this.description,
    required this.positiveMarks,
    required this.negativeMarks,
    required this.instruction,
    required this.className,
    required this.batch,
    required this.accessibility,
    required this.date,
    required this.time,
    required this.duration,
    this.isPremium = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(description, style: const TextStyle(color: Colors.grey)),
            const Divider(height: 20),

            _infoRow("Positive Marks", positiveMarks),
            _infoRow("Negative Marks", negativeMarks),
            _infoRow("Instruction", instruction),
            _infoRow("Class", className),
            _infoRow("Batch", batch),

            Row(
              children: [
                const Text(
                  "Accessibility:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                if (isPremium)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      accessibility,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  )
                else
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      accessibility,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            _infoRow("Date", date),
            _infoRow("Time", time),
            _infoRow("Duration", duration),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _actionButton("View", Colors.teal),
                _actionButton("Print", Colors.deepOrange),
                _actionButton("Download", Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Text("$label: ", style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget _actionButton(String label, Color color, ) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(label, style: TextStyle(color: Colors.white)),
    );
  }
}
