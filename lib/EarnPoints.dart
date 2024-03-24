import 'package:antiscam/FlashcardQuiz.dart';
import 'package:antiscam/WatchAds.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EarnPoints(),
    );
  }
}

class EarnPoints extends StatefulWidget {
  @override
  _EarnPointsState createState() => _EarnPointsState();
}

class _EarnPointsState extends State<EarnPoints> {
  int totalPoints = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: SizedBox(
                  height: 122,
                  child: GradientButton(
                    text: 'Flashcard and Quiz',
                    icon: Icons.question_answer,
                    description: '\nTake quiz to earn points!',
                    gradientColors: [
                      const Color(0xffa8e063),
                      const Color(0xffEDE574)
                    ],
                    iconColor: Colors.black,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FlashcardQuiz(),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: SizedBox(
                  height: 122,
                  child: GradientButton(
                    text: 'Ads',
                    icon: Icons.video_library,
                    description: '\nWatch an ads to get points ',
                    gradientColors: [
                      const Color(0xffa0e6ff),
                      const Color(0xffbac8fb)
                    ],
                    iconColor: Colors.black,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WatchAds(),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: SizedBox(
                  height: 122,
                  child: GradientButton(
                    text: 'Subscription',
                    icon: Icons.subscriptions,
                    description: '\nSubscribe Financial Fraud Alert',
                    gradientColors: [Color(0xff8BA3E5), Color(0xfff9ccff)],
                    iconColor: Colors.black,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: SizedBox(
                  height: 122,
                  child: GradientButton(
                    text: 'Earn Points',
                    icon: Icons.monetization_on_sharp,
                    description: '\nUse points to redeem rewards',
                    gradientColors: [Color(0xfffbe0ff), Color(0xfffeb7bf)],
                    iconColor: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  final String text;
  final String description;
  final IconData icon;
  final List<Color> gradientColors;
  final Color iconColor;
  final VoidCallback? onPressed;

  const GradientButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.description,
    required this.gradientColors,
    required this.iconColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        icon,
                        color: iconColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        text,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
