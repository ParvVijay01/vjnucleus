import 'package:flutter/material.dart';

class TestSummaryScreen extends StatelessWidget {
  final int totalMarks;
  final int totalAnswered;
  final int totalUnanswered;
  final int correctAnswers;
  final int incorrectAnswers;
  final String totalTimeTaken;
  final List<SubjectBreakdownData> subjectBreakdowns;
  final double accuracy;
  final double inaccuracy;

  const TestSummaryScreen({
    super.key,
    required this.totalMarks,
    required this.totalAnswered,
    required this.totalUnanswered,
    required this.correctAnswers,
    required this.incorrectAnswers,
    required this.totalTimeTaken,
    required this.subjectBreakdowns,
    required this.accuracy,
    required this.inaccuracy,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: Text(
                  "Test Summary",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Wrap(
                alignment: WrapAlignment.spaceEvenly,
                spacing: 20,
                runSpacing: 16,
                children: [
                  SummaryItem(title: "Total Marks", value: "$totalMarks"),
                  SummaryItem(title: "Total Answered", value: "$totalAnswered"),
                  SummaryItem(
                    title: "Total Unanswered",
                    value: "$totalUnanswered",
                  ),
                  SummaryItem(
                    title: "Correct Answers",
                    value: "$correctAnswers",
                  ),
                  SummaryItem(
                    title: "Incorrect Answers",
                    value: "$incorrectAnswers",
                  ),
                  SummaryItem(title: "Total Time Taken", value: totalTimeTaken),
                ],
              ),
              const SizedBox(height: 32),
              const Center(
                child: Text(
                  "Subject Breakdown",
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ...subjectBreakdowns
                  .map((subject) => SubjectBreakdownCard(data: subject))
                  .toList(),
              const SizedBox(height: 32),
              AccuracyBar(
                title: "Accuracy",
                value: accuracy,
                color: Colors.cyan,
              ),
              const SizedBox(height: 16),
              AccuracyBar(
                title: "Inaccuracy",
                value: inaccuracy,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- Other widgets (unchanged) ---

class SummaryItem extends StatelessWidget {
  final String title;
  final String value;

  const SummaryItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class SubjectBreakdownData {
  final String subject;
  final int totalQuestions;
  final int correctAnswers;
  final double accuracy;
  final String timeTaken;

  const SubjectBreakdownData({
    required this.subject,
    required this.totalQuestions,
    required this.correctAnswers,
    required this.accuracy,
    required this.timeTaken,
  });
}

class SubjectBreakdownCard extends StatelessWidget {
  final SubjectBreakdownData data;

  const SubjectBreakdownCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.subject.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.teal,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Total Questions: ${data.totalQuestions}   Correct Answers: ${data.correctAnswers}   Accuracy: ${data.accuracy.toStringAsFixed(2)}%",
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: 16,
              width: double.infinity,
              child: LinearProgressIndicator(
                value: data.accuracy / 100,
                backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                minHeight: 16,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text("Total Time Taken: ${data.timeTaken}"),
        ],
      ),
    );
  }
}

class AccuracyBar extends StatelessWidget {
  final String title;
  final double value;
  final Color color;

  const AccuracyBar({
    super.key,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = value.toStringAsFixed(2);
    return Column(
      children: [
        Text(
          "$title: $percentage%",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            height: 16,
            width: double.infinity,
            child: LinearProgressIndicator(
              value: value / 100,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 16,
            ),
          ),
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}
