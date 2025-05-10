import 'package:flutter/material.dart';
import 'package:vjnucleus/screens/auth/login.dart';
import 'package:vjnucleus/screens/home/home.dart';
import 'package:vjnucleus/screens/mentorList/mentor.dart';
import 'package:vjnucleus/screens/profile/profile.dart';
import 'package:vjnucleus/screens/reports/reports.dart';
import 'package:vjnucleus/screens/studyreport/study_report.dart';
import 'package:vjnucleus/screens/testpapers/test_paper.dart';

class AppRoutes {
  static const String home = '/home';
  static const String testPapers = '/testPapers';
  static const String login = '/login';
  static const String studySessionsChart = '/studySessionsChart';
  // static const String noticeBox = '/noticebox';
  // static const String tutorials = '/tutorials';
  static const String profile = '/profile';
  static const String report = '/report';
  static const String mentor = '/mentor';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case onBoarding:
      //   return MaterialPageRoute(builder: (_) => OnboardingScreen());

      case login:
        return MaterialPageRoute(builder: (_) => Login());

      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case mentor:
        return MaterialPageRoute(builder: (_) => MentorList());

      case studySessionsChart:
        return MaterialPageRoute(builder: (_) => StudyReport());

      case testPapers:
        return MaterialPageRoute(builder: (_) => TestPapers());

      case profile:
        return MaterialPageRoute(builder: (_) => Profile());

      case report:
        return MaterialPageRoute(builder: (_) => Reports());

      // case module:
      //   return MaterialPageRoute(builder: (_) => ModuleScreen());

      default:
        return _errorRoute("Page not found!");
    }
  }

  static Route<dynamic> _errorRoute(String message) {
    return MaterialPageRoute(
      builder:
          (_) => Scaffold(
            appBar: AppBar(title: const Text("Error")),
            body: Center(
              child: Text(message, style: const TextStyle(fontSize: 18)),
            ),
          ),
    );
  }
}
