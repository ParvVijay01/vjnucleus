import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:vjnucleus/screens/results/components/piechart.dart';
import 'package:vjnucleus/screens/results/components/test_summary.dart';
import 'package:vjnucleus/screens/studyreport/components/study_sessiocn_chart.dart';

class Results extends StatefulWidget {
  const Results({super.key});

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  List<double> sessionHours = [70, 65, 88];
  List<String> sessionLabels = ['Physics', 'Maths', 'Chemistry'];
  List<double> yourAnalysisNumber = [80, 5, 5];
  List<String> yourAnalysisLabel = ['Correct', 'Incorrect', 'Skipped'];
  List<double> topperAnalysisNumber = [80, 7, 3];
  List<Color> subjectColors = [Colors.blue, Colors.orange, Colors.green];
  List<Color> analysisColors = [
    Color(0xff28A745),
    Color(0xffDC3545),
    Color(0xff6C757D),
  ];
  List<SubjectBreakdownData> subjects = [
    SubjectBreakdownData(
      subject: 'Physics',
      totalQuestions: 30,
      correctAnswers: 20,
      accuracy: 66.7,
      timeTaken: "55 mins",
    ),
    SubjectBreakdownData(
      subject: 'Maths',
      totalQuestions: 30,
      correctAnswers: 20,
      accuracy: 66.7,
      timeTaken: "55 mins",
    ),
    SubjectBreakdownData(
      subject: 'Chemistry',
      totalQuestions: 30,
      correctAnswers: 20,
      accuracy: 66.7,
      timeTaken: "55 mins",
    ),
  ];

  List<PieChartSectionData> getSections() {
    double total = sessionHours.fold(0, (a, b) => a + b);

    return List.generate(sessionHours.length, (i) {
      final percentage = (sessionHours[i] / total) * 100;
      final subjectName = sessionLabels[i];
      return PieChartSectionData(
        color: subjectColors[i % subjectColors.length],
        value: sessionHours[i], // ✅ correct value
        title: '$subjectName\n${percentage.toStringAsFixed(1)}%',
        radius: 60,
        titleStyle: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      );
    });
  }

  List<PieChartSectionData> getYourAnalysis() {
    double total = yourAnalysisNumber.fold(0, (a, b) => a + b);

    return List.generate(yourAnalysisNumber.length, (i) {
      final percentage = (yourAnalysisNumber[i] / total) * 100;
      final analysisName = yourAnalysisLabel[i];
      return PieChartSectionData(
        color: analysisColors[i % analysisColors.length],
        value: yourAnalysisNumber[i], // ✅ correct value
        title: '$analysisName\n${percentage.toStringAsFixed(1)}%',
        radius: 60,
        titleStyle: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      );
    });
  }

  List<PieChartSectionData> getTopperAnalysis() {
    double total = topperAnalysisNumber.fold(0, (a, b) => a + b);

    return List.generate(topperAnalysisNumber.length, (i) {
      final percentage = (topperAnalysisNumber[i] / total) * 100;
      final analysisName = yourAnalysisLabel[i]; // Labels are fine
      return PieChartSectionData(
        color: analysisColors[i % analysisColors.length],
        value: topperAnalysisNumber[i], // ✅ Fixed this line
        title: '$analysisName\n${percentage.toStringAsFixed(1)}%',
        radius: 60,
        titleStyle: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Result")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TestSummaryScreen(
                totalMarks: 250,
                totalAnswered: 85,
                totalUnanswered: 5,
                correctAnswers: 70,
                incorrectAnswers: 15,
                totalTimeTaken: "2 hrs 45 mins",
                subjectBreakdowns: subjects,
                accuracy: 75,
                inaccuracy: 25,
              ),
              // ✅ Original Graph
              StudySessionsChart(
                maxY: 120,
                sessionHours: sessionHours,
                sessionLabels: sessionLabels,
                title: 'Result',
              ),

              const SizedBox(height: 30),

              // ✅ Pie Chart Section
              const Text(
                "Score Distribution",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              PieChartWidget(sections: getSections(), centerText: 'Subjects'),

              const SizedBox(height: 30),
              const Text(
                "Your analysis",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              PieChartWidget(
                sections: getYourAnalysis(),
                centerText: 'Your Analysis',
              ),
              const SizedBox(height: 40),

              const Text(
                "Topper's analysis",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              PieChartWidget(
                sections: getTopperAnalysis(),
                centerText: 'Analysis',
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
