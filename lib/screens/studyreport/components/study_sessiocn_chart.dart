import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StudySessionsChart extends StatelessWidget {
  final List<double> sessionHours;
  final List<String> sessionLabels;
  final String title;
  final double maxY;

  const StudySessionsChart({
    super.key,
    required this.sessionHours,
    required this.sessionLabels,
    required this.title,
    required this.maxY,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C2E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),

          // Scrollable Bar Chart
          SizedBox(
            height: 300,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: sessionHours.length * 120,
                child: BarChart(
                  BarChartData(
                    maxY: maxY,
                    barTouchData: BarTouchData(enabled: true),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 30,
                          getTitlesWidget:
                              (value, _) => Text(
                                value.toInt().toString(),
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 15,
                                ),
                              ),
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 48,
                          getTitlesWidget: (value, meta) {
                            int index = value.toInt();
                            return SideTitleWidget(
                              meta: meta,
                              space: 8,
                              child: Transform.rotate(
                                angle: -0.4,
                                child: Text(
                                  index < sessionLabels.length
                                      ? sessionLabels[index]
                                      : '',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    gridData: FlGridData(
                      show: true,
                      drawHorizontalLine: false,
                      drawVerticalLine: true,
                      verticalInterval: 1,
                      getDrawingVerticalLine:
                          (value) =>
                              FlLine(color: Colors.white10, strokeWidth: 1),
                    ),
                    barGroups:
                        sessionHours.asMap().entries.map((entry) {
                          return BarChartGroupData(
                            x: entry.key,
                            barRods: [
                              BarChartRodData(
                                toY: entry.value,
                                width: 70,
                                color: Colors.tealAccent.shade400,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ],
                          );
                        }).toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
