import 'package:flutter/material.dart';
import 'package:vjnucleus/screens/home/components/drawer.dart';
import 'package:vjnucleus/screens/reattendTest/components/reattend_test_card.dart';

class ReattendTest extends StatefulWidget {
  const ReattendTest({super.key});

  @override
  State<ReattendTest> createState() => _ReattendTestState();
}

class _ReattendTestState extends State<ReattendTest> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
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
        title: Text("Reattend Test"),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ReattendTestCard(
              title: "Physics Chapter Test - Kinematics",
              description:
                  "Test your understanding of motion in one and two dimensions.",
              date: "16 May 2025",
              onAttend: () {},
              onResult: () {
                Navigator.pushNamed(context, '/result');
              },
            ),
            ReattendTestCard(
              title: "Physics Chapter Test - Kinematics",
              description:
                  "Test your understanding of motion in one and two dimensions.",
              date: "16 May 2025",
              onAttend: () {},
              onResult: () {
                Navigator.pushNamed(context, '/result');
              },
            ),
            ReattendTestCard(
              title: "Physics Chapter Test - Kinematics",
              description:
                  "Test your understanding of motion in one and two dimensions.",
              date: "16 May 2025",
              onAttend: () {},
              onResult: () {
                Navigator.pushNamed(context, '/result');
              },
            ),
            ReattendTestCard(
              title: "Physics Chapter Test - Kinematics",
              description:
                  "Test your understanding of motion in one and two dimensions.",
              date: "16 May 2025",
              onAttend: () {},
              onResult: () {
                Navigator.pushNamed(context, '/result');
              },
            ),
          ],
        ),
      ),
    );
  }
}
