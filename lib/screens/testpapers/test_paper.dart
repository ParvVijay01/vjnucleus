import 'package:flutter/material.dart';
import 'package:vjnucleus/screens/home/components/drawer.dart';
import 'package:vjnucleus/screens/testpapers/components/test_card.dart';

class TestPapers extends StatefulWidget {
  const TestPapers({super.key});

  @override
  State<TestPapers> createState() => _TestPapersState();
}

class _TestPapersState extends State<TestPapers> {
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
        title: Text("Test Papers"),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TestCard(
              title: 'JEE Main Full Syllabus Test - 1',
              description: 'Covers all chapters of Physics, Chemistry & Math.',
              positiveMarks: '+4',
              negativeMarks: '-1',
              instruction: 'Do not refresh the page during the test.',
              className: 'Class 12',
              batch: 'Alpha 2025',
              accessibility: 'Free',
              date: '2025-05-01',
              time: '10:00 AM',
              duration: '3 hours',
              isPremium: true,
            ),

            TestCard(
              title: 'JEE Main Full Syllabus Test - 1',
              description: 'Covers all chapters of Physics, Chemistry & Math.',
              positiveMarks: '+4',
              negativeMarks: '-1',
              instruction: 'Do not refresh the page during the test.',
              className: 'Class 12',
              batch: 'Alpha 2025',
              accessibility: 'Premium',
              date: '2025-05-01',
              time: '10:00 AM',
              duration: '3 hours',
              isPremium: true,
            ),

            TestCard(
              title: 'JEE Main Full Syllabus Test - 1',
              description: 'Covers all chapters of Physics, Chemistry & Math.',
              positiveMarks: '+4',
              negativeMarks: '-1',
              instruction: 'Do not refresh the page during the test.',
              className: 'Class 12',
              batch: 'Alpha 2025',
              accessibility: 'Premium',
              date: '2025-05-01',
              time: '10:00 AM',
              duration: '3 hours',
              isPremium: true,
            ),
          ],
        ),
      ),
    );
  }
}
