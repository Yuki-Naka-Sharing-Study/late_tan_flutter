import 'dart:math';
import 'package:flutter/material.dart';
import '../data/words.dart'; // 単語データをインポート

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  Map<String, String>? currentWord;
  String userInput = "";
  int score = 0;
  int questionCount = 0;

  @override
  void initState() {
    super.initState();
    loadNewWord();
  }

  void loadNewWord() {
    setState(() {
      currentWord = words[Random().nextInt(words.length)];
      userInput = "";
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
            Text("Convert to Latin American Spanish:", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text(currentWord?["es-ES"] ?? "", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) => setState(() => userInput = value),
              decoration: InputDecoration(labelText: "Type the Latin American Spanish word"),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: checkAnswer, child: Text("Submit")),
            SizedBox(height: 20),
            Text("Score: $score / $questionCount", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
