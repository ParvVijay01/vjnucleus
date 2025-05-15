import 'package:flutter/material.dart';
import 'package:vjnucleus/utility/constants/colors.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: IKColors.light, // Background color for the entire drawer
        child: Column(
          children: [
            SizedBox(height: 50), // Spacing from top
            Center(
              child: Column(
                children: [
                  CircleAvatar(radius: 40),
                  SizedBox(height: 10),
                  Text(
                    "Name",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "userEmail",
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Divider(
              color: Colors.black54,
              thickness: 1,
              indent: 40,
              endIndent: 40,
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.black),
              title: Text('Home', style: TextStyle(color: Colors.black)),
              onTap:
                  () => {
                    Navigator.pop(context),
                    Navigator.pushNamed(context, '/home'),
                  },
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.black),
              title: Text('Profile', style: TextStyle(color: Colors.black)),
              onTap:
                  () => {
                    Navigator.pop(context),
                    Navigator.pushNamed(context, '/profile'),
                  },
            ),
            ListTile(
              leading: Icon(Icons.dashboard, color: Colors.black),
              title: Text(
                'Test Results',
                style: TextStyle(color: Colors.black),
              ),
              onTap:
                  () => {
                    Navigator.pop(context),
                    Navigator.pushNamed(context, '/report'),
                  },
            ),
            ListTile(
              leading: Icon(Icons.dashboard, color: Colors.black),
              title: Text('Mentor List', style: TextStyle(color: Colors.black)),
              onTap:
                  () => {
                    Navigator.pop(context),
                    Navigator.pushNamed(context, '/mentor'),
                  },
            ),
            ListTile(
              leading: Icon(Icons.report_sharp, color: Colors.black),
              title: Text(
                'Study Report',
                style: TextStyle(color: Colors.black),
              ),
              onTap:
                  () => {
                    Navigator.pop(context),
                    Navigator.pushNamed(context, '/studySessionsChart'),
                  },
            ),

            ListTile(
              leading: Icon(Icons.dashboard, color: Colors.black),
              title: Text('Test Papers', style: TextStyle(color: Colors.black)),
              onTap:
                  () => {
                    Navigator.pop(context),
                    Navigator.pushNamed(context, '/testPapers'),
                  },
            ),

            ListTile(
              leading: Icon(Icons.dashboard, color: Colors.black),
              title: Text('scoreboard', style: TextStyle(color: Colors.black)),
              onTap:
                  () => {
                    Navigator.pop(context),
                    Navigator.pushNamed(context, '/scoreboard'),
                  },
            ),

            ListTile(
              leading: Icon(Icons.dashboard, color: Colors.black),
              title: Text('Add Session', style: TextStyle(color: Colors.black)),
              onTap:
                  () => {
                    Navigator.pop(context),
                    Navigator.pushNamed(context, '/session'),
                  },
            ),

            Spacer(), // Push logout button to the bottom
            Divider(
              color: Colors.black54,
              thickness: 1,
              indent: 40,
              endIndent: 40,
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.red),
              title: Text('Log Out', style: TextStyle(color: Colors.red)),
              onTap: () => {Navigator.pushNamed(context, '/login')},
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
