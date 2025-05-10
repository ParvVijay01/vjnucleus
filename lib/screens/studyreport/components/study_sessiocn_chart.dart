import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StudySessionsChart extends StatelessWidget {
  final List<double> sessionHours = [5, 4, 6, 7, 3, 8];
  final List<String> sessionLabels = [
    "Session 1",
    "Session 2",
    "Session 3",
    "Session 4",
    "Session 5",
    "Session 6",
  ];

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
          const Text(
            "Study Sessions Time",
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
                width: sessionHours.length * 80,
                child: BarChart(
                  BarChartData(
                    maxY: 10,
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
                          reservedSize: 48, // More space for angled labels
                          getTitlesWidget: (value, meta) {
                            int index = value.toInt();
                            return SideTitleWidget(
                              meta: meta,
                              space: 8,
                              child: Transform.rotate(
                                angle: -0.4, // Slight tilt (rad ~23°)
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
                      drawHorizontalLine: false, // ❌ Disable horizontal lines
                      drawVerticalLine: true, // ✅ Enable vertical lines
                      verticalInterval: 1,
                      getDrawingVerticalLine:
                          (value) =>
                              FlLine(color: Colors.white10, strokeWidth: 1),
                    ),

                    barGroups:
                        sessionHours
                            .asMap()
                            .entries
                            .map(
                              (entry) => BarChartGroupData(
                                x: entry.key,
                                barRods: [
                                  BarChartRodData(
                                    toY: entry.value,
                                    width: 50,
                                    color: Colors.tealAccent.shade400,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ],
                              ),
                            )
                            .toList(),
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
