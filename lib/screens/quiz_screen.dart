import 'dart:math';
import 'package:flutter/material.dart';
import '../data/words.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  static const int totalQuestions = 10;
  final TextEditingController _controller = TextEditingController();
  Map<String, String>? currentWord;
  String userInput = "";
  int score = 0;
  int questionCount = 0;

  @override
  void initState() {
    super.initState();
    loadNewWord();
  }

  @override
  void dispose() {
    _controller.dispose(); // メモリリーク防止のために破棄
    super.dispose();
  }

  void loadNewWord() {
    if (questionCount >= totalQuestions) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(score: score, total: totalQuestions),
        ),
      );
      return;
    }

    setState(() {
      currentWord = words[questionCount]; // リストの順番通りに取得
      userInput = "";
      _controller.clear(); // ← TextField の入力を確実にクリア
    });
  }

  void checkAnswer() {
    if (userInput.trim().toLowerCase() == currentWord?["es-LA"]?.toLowerCase()) {
      score++;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Correct!")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong! The correct answer is ${currentWord?["es-LA"]}")));
    }

    questionCount++;
    loadNewWord();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Spanish Quiz")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Question ${questionCount + 1} / $totalQuestions", style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text("Convert to Latin American Spanish:", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text(currentWord?["es-ES"] ?? "", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            TextField(
              controller: _controller, // ← Controller を指定
              onChanged: (value) => setState(() => userInput = value),
              decoration: InputDecoration(labelText: "Type the Latin American Spanish word"),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: checkAnswer, child: Text("Submit")),
            SizedBox(height: 20),
            Text("Score: $score", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
