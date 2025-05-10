import 'package:flutter/material.dart';

class MentorCard extends StatelessWidget {
  final String name;
  final String description;
  final double rating;
  final List<String> expertise;
  final String experience;
  final String availability;
  final int mentees;
  final String imagePath; // Local asset or network URL

  const MentorCard({
    super.key,
    required this.name,
    required this.description,
    required this.rating,
    required this.expertise,
    required this.experience,
    required this.availability,
    required this.mentees,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Avatar
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                imagePath,
              ), // use NetworkImage for URLs
            ),
            const SizedBox(height: 16),

            // Name & Description
            Text(
              name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 16),

            // Ranking
            _infoRow(
              label: "Ranking:",
              child: Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.shade600,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        "4.9",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.star, size: 14, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),

            const Divider(),

            // Expertise
            _infoRow(label: "Expertise:", value: expertise.join(", ")),
            const Divider(),

            // Experience
            _infoRow(label: "Experience:", value: experience),
            const Divider(),

            // Availability
            _infoRow(label: "Availability:", value: availability),
            const Divider(),

            // Total Mentees
            _infoRow(
              label: "Total Mentees:",
              child: Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.teal.shade600,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    "1200",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow({required String label, String? value, Widget? child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$label ", style: const TextStyle(fontWeight: FontWeight.bold)),
          child ??
              Flexible(
                child: Text(
                  value ?? "",
                  style: const TextStyle(color: Colors.black87),
                ),
              ),
        ],
      ),
    );
  }
}
