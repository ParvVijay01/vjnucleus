import 'package:flutter/material.dart';
import 'package:vjnucleus/screens/home/components/drawer.dart';
import 'package:vjnucleus/screens/studyreport/components/study_sessiocn_chart.dart';

class ScoreChart extends StatefulWidget {
  const ScoreChart({super.key});

  @override
  State<ScoreChart> createState() => _ScoreChartState();
}

class _ScoreChartState extends State<ScoreChart> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Scoreboard"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
          icon: Icon(Icons.menu),
        ),
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          StudySessionsChart(
            sessionHours: [50, 40, 60, 70, 30, 80],
            sessionLabels: [
              "Maths",
              "Physics",
              "Chemistry",
              "Biology",
              "History",
              "Genral Knowledge",
            ],
            title: 'Scoreboard',
            maxY: 100,
          ),
        ],
      ),
    );
  }
}
