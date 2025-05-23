import 'package:flutter/material.dart';
import 'package:vjnucleus/screens/home/components/drawer.dart';
import 'package:vjnucleus/screens/studyreport/components/study_sessiocn_chart.dart';

class StudyReport extends StatefulWidget {
  const StudyReport({super.key});

  @override
  State<StudyReport> createState() => _StudyReportState();
}

class _StudyReportState extends State<StudyReport> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Study Report"),
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
            sessionHours: [5, 4, 6, 7, 3, 8],
            sessionLabels: [
              "Session 1",
              "Session 2",
              "Session 3",
              "Session 4",
              "Session 5",
              "Session 6",
            ],
            title: 'Study Sessions',
            maxY: 10,
          ),
        ],
      ),
    );
  }
}
