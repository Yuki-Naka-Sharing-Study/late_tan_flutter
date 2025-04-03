import 'package:flutter/material.dart';
import 'screens/quiz_screen.dart';

void main() {
  runApp(SpanishQuizApp());
}

class SpanishQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spanish Quiz',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: QuizScreen(),
    );
  }
}
