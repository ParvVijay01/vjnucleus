import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:vjnucleus/config/app.dart';
import 'package:vjnucleus/routes/routes.dart';

void main() async {
  AppRoutes.cameras = await availableCameras();
  runApp(const MyApp());
}