import 'dart:async';
import 'package:antiscam/Home.dart';
import 'package:antiscam/LearnMore.dart';
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
  bool _timesUp = false;
  double _previousScale = 1.0;
  double _scale = 1.0;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Is this a scam?',
      'options': ['Yes, this is a scam', 'No, this is not a scam'],
      'answer': 'Yes, this is a scam',
      'imageUrl':
          'https://www.independentage.org/sites/default/files/quiz/2.png',
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
      'imageUrl':
          'https://consumer.gov/sites/default/files/pictures/1018-job-ad.jpg',
    },
    {
      'question':
          'You\'re about to book a cleaning service. To confirm the booking, they ask you to download an unknown app from a link they provided. What would you do? ',
      'options': ['Proceed to Book', 'Ignore'],
      'answer': 'Ignore',
      'imageUrl':
          'https://media.freemalaysiatoday.com/wp-content/uploads/2022/10/lifestyle-whatsapp-emel-pic-191022.jpg',
    },
    {
      'question':
          'You turn on your computer and a box pops up telling you updates are available for your computer with a box saying \'Install updates\'.\nIs this a scam?',
      'options': ['Yes, this is a scam', 'No, this is not a scam'],
      'answer': 'No, this is not a scam',
      'imageUrl':
          'https://www.independentage.org/sites/default/files/quiz/7.png',
    },
    {
      'question': 'Is this a scam?',
      'options': ['Yes, this is a scam', 'No, this is not a scam'],
      'answer': 'No, this is not a scam',
      'imageUrl':
          'https://www.independentage.org/sites/default/files/quiz/9.png',
    },
    {
      'question': 'Is this a scam?',
      'options': ['Yes, this is a scam', 'No, this is not a scam'],
      'answer': 'Yes, this is a scam',
      'imageUrl':
          'https://assets-global.website-files.com/5e5ff4f0165cd367cc7ca88f/6009f5332b589bbe3dcfcc5a_Screen%20Shot%202020-11-24%20at%205.40.57%20PM.png',
    },
    {
      'question': 'Is this a scam?',
      'options': ['Yes, this is a scam', 'No, this is not a scam'],
      'answer': 'Yes, this is a scam',
      'imageUrl':
          'https://img.stomp.com.sg/s3fs-public/images/2023/07/antiscam.jpg',
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
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdown > 0) {
          _countdown--;
        } else {
          _timer?.cancel();
          _timesUp = true;
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

      _scale = 1.0;
      if (_currentIndex < _questions.length) {
        _countdown = 20;
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
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 50,
                  color: color,
                ),
                const SizedBox(height: 20),
                Text(
                  correct ? 'Correct!' : 'Wrong!',
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold, color: color),
                ),
                const SizedBox(height: 10),
                Text(
                  correct
                      ? 'You got it right!'
                      : 'The correct answer is: ${_questions[_currentIndex]['answer']}',
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    _nextQuestion();
                  },
                  child:
                      const Text('Next', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showQuizCompletedDialog() {
    String message;
    TextStyle boldStyle = const TextStyle(fontWeight: FontWeight.bold);
    TextStyle normalStyle = const TextStyle(fontWeight: FontWeight.normal);

    String level = '';
    if (_score <= 3) {
      level = 'The Innocent';
    } else if (_score <= 7) {
      level = 'The Average Joe';
    } else {
      level = 'The Anti-Scammer';
    }

    int stars = (_score <= 3 ? 1 : (_score <= 7 ? 2 : 3));

    List<Widget> starIcons = List.generate(3, (index) {
      if (index < stars) {
        return const Icon(Icons.star, color: Colors.amber);
      } else {
        return const Icon(Icons.star_border, color: Colors.grey);
      }
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  level,
                  style: boldStyle.copyWith(fontSize: 20),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: starIcons,
                ),
                const SizedBox(height: 20),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'You answered ',
                        style: normalStyle,
                      ),
                      TextSpan(
                        text: '$_score out of ${_questions.length} ',
                        style: boldStyle,
                      ),
                      TextSpan(
                        text: 'correctly.',
                        style: normalStyle,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 130,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Close',
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  WidgetSpan _buildStarIcons(int stars) {
    return WidgetSpan(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (int i = 0; i < stars; i++)
              const Icon(Icons.star, color: Colors.amber, size: 30),
            for (int i = stars; i < 3; i++)
              const Icon(Icons.star_border, color: Colors.grey, size: 30),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget quizContent;
    if (_currentIndex < _questions.length) {
      quizContent = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.access_time_filled, color: Colors.redAccent),
              const SizedBox(width: 5),
              Text(
                '$_countdown',
                style: const TextStyle(fontSize: 24, color: Colors.redAccent),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              _questions[_currentIndex]['question'],
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          if (_questions[_currentIndex]['imageUrl'] != null)
            GestureDetector(
              onDoubleTap: () {
                setState(() {
                  _scale = _scale == 1.0 ? 2.0 : 1.0;
                });
              },
              onScaleStart: (ScaleStartDetails details) {
                _previousScale = _scale;
              },
              onScaleUpdate: (ScaleUpdateDetails details) {
                setState(() {
                  _scale = _previousScale * details.scale;
                });
              },
              child: Transform.scale(
                scale: _scale,
                child: Image.network(
                  _questions[_currentIndex]['imageUrl'],
                  height: 300,
                  width: 300,
                ),
              ),
            ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _questions[_currentIndex]['options']
                .map<Widget>((option) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        onPressed: () => _checkAnswer(option),
                        child: Text(option,
                            style: const TextStyle(color: Colors.white)),
                      ),
                    ))
                .toList(),
          ),
        ],
      );
    } else {
      String message;
      int points;
      IconData iconData;
      TextStyle boldStyle = const TextStyle(fontWeight: FontWeight.bold);
      TextStyle normalStyle = const TextStyle(fontWeight: FontWeight.normal);

      int stars = (_score <= 3 ? 1 : (_score <= 7 ? 2 : 3));
      iconData = Icons.attach_money;
      if (_score <= 3) {
        message =
            'The Innocent\n\nOh no!!! Your free-spirited careless nature might be your downfall.\n\nFret not, click on Learn More to become a true scam defender.';
        points = 100;
      } else if (_score <= 7) {
        message =
            'The Average Joe\n\nAlmost there! You\'re aware of threats, but you don\'t always pay as much attention.\n\nFret not, click on Learn More to become a true scam defender.';
        points = 300;
      } else {
        message =
            'The Anti-Scammer\n\nGood job! You definitely know your way around beating scams.\n\nYour intelligence, composure, and vigilance make you a formidable defender against potential scam threats.';
        points = 500;
      }

      quizContent = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 80,
            color: Colors.amber,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Points Earned: $points',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.all(20),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black, fontSize: 20.0),
                  children: [
                    TextSpan(text: 'The ', style: boldStyle),
                    TextSpan(
                      text: _score <= 3
                          ? 'Innocent'
                          : (_score <= 7 ? 'Average Joe' : 'Anti-Scammer'),
                      style: boldStyle,
                    ),
                    const TextSpan(text: '\n\n'),
                    _buildStarIcons(stars),
                    const TextSpan(text: '\n\n'),
                    TextSpan(
                        text: message.split('\n\n')[1],
                        style: normalStyle.copyWith(fontSize: 16)),
                    const TextSpan(text: '\n\n'),
                    TextSpan(
                        text: message.split('\n\n')[2],
                        style: normalStyle.copyWith(fontSize: 16)),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 130,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScamCategoriesPage()),
                    );
                  },
                  child: const Text('Learn More',
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 130,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: const Text('Back to Home',
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ),
            ],
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Scam Buster Challenge',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    children: [
                      Text(
                        '100',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.monetization_on,
                        size: 16,
                        color: Colors.amber,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: quizContent,
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
        title: const Text('Image'),
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
