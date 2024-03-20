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
      'question': 'Is this a scam?',
      'options': ['Yes, this is a scam', 'No, this is not a scam'],
      'answer': 'Yes, this is a scam',
      'imageUrl': 'https://www.independentage.org/sites/default/files/quiz/2.png',
    },
    {
      'question':
          '\"Hello, this is Jayden calling from AA Bank. I\'m just ringing to let you know there has been some suspicious activity on your current account. I need to run through your recent transactions to check that they were actually made by you. I need to confirm who I\'m talking to, so could you tell me your date or birth and confirm what accounts you hold with us?\" \n\nIs this a scam?',
      'options': ['Yes, this is a scam', 'No, this is not a scam'],
      'answer': 'No, this is not a scam',
      'imageUrl': null,
    },
    {
      'question': 'Look at this irresistible offer! \nWhat would you do?',
      'options': ['Sign Up', 'Ignore'],
      'answer': 'Ignore',
      'imageUrl': 'https://consumer.gov/sites/default/files/pictures/1018-job-ad.jpg',
    },
    {
      'question':
          'You\'re about to book a cleaning service. To confirm the booking, they ask you to download an unknown app from a link they provided. What would you do? ',
      'options': ['Proceed to Book', 'Ignore'],
      'answer': 'Ignore',
      'imageUrl': 'https://media.freemalaysiatoday.com/wp-content/uploads/2022/10/lifestyle-whatsapp-emel-pic-191022.jpg',
    },
    {
      'question': 'What is the largest planet in our solar system?',
      'options': ['Earth', 'Jupiter', 'Saturn', 'Mars'],
      'answer': 'Jupiter',
      'imageUrl': null,
    },
    {
      'question': 'Which country won the FIFA World Cup in 2018?',
      'options': ['Germany', 'Brazil', 'France', 'Spain'],
      'answer': 'France',
      'imageUrl': null,
    },
    {
      'question': 'Who painted the Mona Lisa?',
      'options': ['Vincent van Gogh', 'Leonardo da Vinci', 'Pablo Picasso', 'Michelangelo'],
      'answer': 'Leonardo da Vinci',
      'imageUrl': null,
    },
    {
      'question': 'What is the largest ocean on Earth?',
      'options': ['Atlantic Ocean', 'Arctic Ocean', 'Indian Ocean', 'Pacific Ocean'],
      'answer': 'Pacific Ocean',
      'imageUrl': null,
    },
  ];

  Timer? _timer;
  int _countdown = 20;

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
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    _nextQuestion();
                  },
                  child: Text('Next', style: TextStyle(color: Colors.white)),
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
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close', style: TextStyle(color: Colors.white)),
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
      body: SingleChildScrollView(
        child: _currentIndex < _questions.length
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.access_time_filled, color: Colors.redAccent),
                      SizedBox(width: 5),
                      Text(
                        '$_countdown',
                        style: TextStyle(fontSize: 24, color: Colors.redAccent),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    _questions[_currentIndex]['question'],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  if (_questions[_currentIndex]['imageUrl'] != null)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FullScreenImage(imageUrl: _questions[_currentIndex]['imageUrl']),
                          ),
                        );
                      },
                      child: Image.network(
                        _questions[_currentIndex]['imageUrl'],
                        height: 300,
                        width: 300,
                      ),
                    ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: _questions[_currentIndex]['options']
                        .map<Widget>((option) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                                onPressed: () => _checkAnswer(option),
                                child: Text(option, style: TextStyle(color: Colors.white)),
                              ),
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
      ),
    );
  }
}

class FullScreenImage extends StatefulWidget {
  final String imageUrl;

  FullScreenImage({required this.imageUrl});

  @override
  _FullScreenImageState createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {
  double _scale = 0.3;
  double _previousScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
      ),
      body: Center(
        child: GestureDetector(
          onScaleStart: (ScaleStartDetails details) {
            _previousScale = _scale;
          },
          onScaleUpdate: (ScaleUpdateDetails details) {
            setState(() {
              _scale = _previousScale * details.scale;
            });
          },
          child: ClipRect(
            child: OverflowBox(
              alignment: Alignment.center,
              maxWidth: double.infinity,
              maxHeight: double.infinity,
              child: Transform.scale(
                scale: _scale,
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
