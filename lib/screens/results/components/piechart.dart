import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PieChartWidget extends StatelessWidget {
  final List<PieChartSectionData> sections;
  final double radius;
  final String centerText;

  const PieChartWidget({
    super.key,
    required this.sections,
    this.radius = 100,
    this.centerText = '',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius * 2,
      height: radius * 2,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PieChart(
            PieChartData(
              sections: sections,
              centerSpaceRadius: radius * 0.7,
              sectionsSpace: 2,
              startDegreeOffset: -90,
            ),
          ),
          if (centerText.isNotEmpty)
            Text(
              centerText,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
        ],
      ),
    );
  }
}
