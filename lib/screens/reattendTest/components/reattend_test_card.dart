import 'package:flutter/material.dart';

class ReattendTestCard extends StatefulWidget {
  final String title;
  final String description;
  final String date;
  final VoidCallback onAttend;
  final VoidCallback onResult;

  const ReattendTestCard({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.onAttend,
    required this.onResult,
  });

  @override
  State<ReattendTestCard> createState() => _ReattendTestCardState();
}

class _ReattendTestCardState extends State<ReattendTestCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        color: Colors.white70,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(
                widget.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 8),

              /// Description
              Text(
                widget.description,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 10),

              /// Date
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Date: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: widget.date,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade800,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              /// Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: widget.onAttend,
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: const Color(0xFF449993),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                          child: Text(
                            "Attend",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: GestureDetector(
                      onTap: widget.onResult,
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: const Color(0xFF51C06F),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                          child: Text(
                            "Result",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
