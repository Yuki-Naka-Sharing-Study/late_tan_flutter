import 'package:flutter/material.dart';
import 'quiz_screen.dart'; // クイズ画面に戻るためにインポート

class ResultScreen extends StatelessWidget {
  final int score;
  final int total;

  ResultScreen({required this.score, required this.total});

  @override
  Widget build(BuildContext context) {
    double accuracy = (score / total) * 100;

    return Scaffold(
      appBar: AppBar(title: Text("Quiz Result")),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Quiz Finished!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Text("Your Score: $score / $total", style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Text("Accuracy: ${accuracy.toStringAsFixed(1)}%", style: TextStyle(fontSize: 20)),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => QuizScreen()),
                  );
                },
                child: Text("Play Again"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
