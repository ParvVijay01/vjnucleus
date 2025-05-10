import 'package:flutter/material.dart';
import 'package:vjnucleus/screens/home/components/drawer.dart';
import 'package:vjnucleus/screens/mentorList/components/mentor_card.dart';
import 'package:vjnucleus/utility/constants/images.dart';

class MentorList extends StatefulWidget {
  const MentorList({super.key});

  @override
  State<MentorList> createState() => _MentorListState();
}

class _MentorListState extends State<MentorList> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Mentor List"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
          icon: Icon(Icons.menu),
        ),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MentorCard(
              name: "Dr. Anjali Mehta",
              description:
                  "Expert in Physics with 15+ years of experience in mentoring JEE & NEET aspirants.",
              rating: 4.9,
              expertise: ["Physics", "Concept Building", "Doubt Solving"],
              experience: '15 years',
              availability: 'Mon–Fri, 5 PM – 9 PM',
              mentees: 1200,
              imagePath: IKImages.logo,
            ),

            MentorCard(
              name: "Dr. Anjali Mehta",
              description:
                  "Expert in Physics with 15+ years of experience in mentoring JEE & NEET aspirants.",
              rating: 4.9,
              expertise: ["Physics", "Concept Building", "Doubt Solving"],
              experience: '15 years',
              availability: 'Mon–Fri, 5 PM – 9 PM',
              mentees: 1200,
              imagePath: IKImages.logo,
            ),

            MentorCard(
              name: "Dr. Anjali Mehta",
              description:
                  "Expert in Physics with 15+ years of experience in mentoring JEE & NEET aspirants.",
              rating: 4.9,
              expertise: ["Physics", "Concept Building", "Doubt Solving"],
              experience: '15 years',
              availability: 'Mon–Fri, 5 PM – 9 PM',
              mentees: 1200,
              imagePath: IKImages.logo,
            ),
          ],
        ),
      ),
    );
  }
}
