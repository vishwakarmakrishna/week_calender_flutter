import 'package:flutter/material.dart';
import 'package:interview_app/resources/theme_manager.dart';
import 'package:interview_app/views/pages/home.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter InterView App',
      theme: getApplicationTheme(),
      home: const HomePage(),
    );
  }
}
