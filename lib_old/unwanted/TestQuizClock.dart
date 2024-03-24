import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: QuizPage(),
  ));
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentIndex = 0;
  int _score = 0;
  bool _isAnswered = false;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is the capital of France?',
      'options': ['Paris', 'London', 'Berlin', 'Rome'],
      'answer': 'Paris',
      'imageUrl': null,
    },
    {
      'question': 'What is the largest mammal?',
      'options': ['Elephant', 'Blue whale', 'Giraffe', 'Hippopotamus'],
      'answer': 'Blue whale',
      'imageUrl': 'https://www.example.com/image1.jpg',
    },
    // Add more questions here...
  ];

  Timer? _timer;
  int _countdown = 10;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdown > 0) {
          _countdown--;
        } else {
          _timer?.cancel();
          _showResultDialog();
        }
      });
    });
  }

  void _checkAnswer(String selectedAnswer) {
    if (!_isAnswered) {
      setState(() {
        _isAnswered = true;
        _timer?.cancel();
        if (selectedAnswer == _questions[_currentIndex]['answer']) {
          _score++;
          _showResultDialog(correct: true);
        } else {
          _showResultDialog(correct: false);
        }
      });
    }
  }

  void _nextQuestion() {
    setState(() {
      _currentIndex++;
      if (_currentIndex < _questions.length) {
        _countdown = 10;
        _isAnswered = false;
        startTimer();
      } else {
        _showQuizCompletedDialog();
      }
    });
  }

  void _showResultDialog({bool correct = false}) {
    IconData icon = correct ? Icons.check_circle : Icons.cancel;
    Color color = correct ? Colors.green : Colors.red;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 50,
                  color: color,
                ),
                SizedBox(height: 20),
                Text(
                  correct ? 'Correct!' : 'Wrong!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color),
                ),
                SizedBox(height: 10),
                Text(
                  correct ? 'You got it right!' : 'The correct answer is: ${_questions[_currentIndex]['answer']}',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _nextQuestion();
                  },
                  child: Text('Next'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showQuizCompletedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Quiz Completed',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  'Your score: $_score/${_questions.length}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: _currentIndex < _questions.length
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.access_time_filled, color: Colors.redAccent,),
                    SizedBox(width: 5),
                    Text(
                      '$_countdown',
                      style: TextStyle(fontSize: 24, color: Colors.redAccent,),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  _questions[_currentIndex]['question'],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: _questions[_currentIndex]['options']
                      .map<Widget>((option) => ElevatedButton(
                            onPressed: () => _checkAnswer(option),
                            child: Text(option),
                          ))
                      .toList(),
                ),
              ],
            )
          : Center(
              child: Text(
                'Quiz completed! Your score: $_score/${_questions.length}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
    );
  }
}
