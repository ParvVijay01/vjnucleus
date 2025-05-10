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
      body: Column(children: [StudySessionsChart()]),
    );
  }
}
