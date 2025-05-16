import 'package:flutter/material.dart';
import 'package:vjnucleus/screens/home/components/drawer.dart';
import 'package:vjnucleus/screens/reports/component/report_card.dart';

class Reports extends StatefulWidget {
  const Reports({super.key});

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
          icon: Icon(Icons.menu),
        ),
        title: Text("Tests List"),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MockTestCard(
              title: "Jee Advanced Mock Test -3",
              description:
                  "This test covers Physics, Chemistry, and Maths. Bases on latest exam pattern",
              date: "2025-04-30",
              totalParticipants: "500",
              maxMarks: "360",
              startTime: "10:00 AM",
              endTime: "1:00 PM",
              onViewResult: () {
                Navigator.pushNamed(context, '/result');
              },
            ),
            MockTestCard(
              title: "Jee Advanced Mock Test -3",
              description:
                  "This test covers Physics, Chemistry, and Maths. Bases on latest exam pattern",
              date: "2025-04-30",
              totalParticipants: "500",
              maxMarks: "360",
              startTime: "10:00 AM",
              endTime: "1:00 PM",
              onViewResult: () {},
            ),
            MockTestCard(
              title: "Jee Advanced Mock Test -3",
              description:
                  "This test covers Physics, Chemistry, and Maths. Bases on latest exam pattern",
              date: "2025-04-30",
              totalParticipants: "500",
              maxMarks: "360",
              startTime: "10:00 AM",
              endTime: "1:00 PM",
              onViewResult: () {},
            ),
          ],
        ),
      ),
    );
  }
}
