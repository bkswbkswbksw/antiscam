import 'package:antiscam/Flashcard.dart';
import 'package:antiscam/Quiz.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FlashcardQuiz());
}

class FlashcardQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: MyTabs(),
    );
  }
}

class MyTabs extends StatefulWidget {
  @override
  _MyTabsState createState() => _MyTabsState();
}

class _MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> tabTitles = ['Flashcards', 'Quiz'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          tabTitles[_tabController.index],
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              child: Text(
                'Flashcards',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
            Tab(
              child: Text(
                'Quiz',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ),
          ],
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.black,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Flashcards(titles: [
            "Phishing Scams",
            "Identity Theft",
            "Ponzi Schemes",
            "Fake Check Scams",
            "Online Auction Fraud",
            "Romance Scams",
            "Investment Fraud",
            "Credit Card Fraud",
            "Tech Support Scams",
            "Lottery Scams"
          ], contents: [
            "Fake emails tricking for personal info.",
            "Unauthorized personal info for financial gain.",
            "Promise high returns with newer investors.",
            "Send fake checks, request return funds.",
            "Fraudulent activities on online auctions.",
            "Fake online romances for financial gain.",
            "Deceptive financial practices tricking investors.",
            "Unauthorized credit card use for purchases.",
            "Scammers pose as tech support reps.",
            "Victims pay for nonexistent lottery winnings."
          ]),
          Quiz(
            titles: [
              'Scam Buster Challenge',
              'Scam Alert',
              'Spot the Scam',
              'Fraud IQ',
              'Scam or Legit',
              'Fraud Prevention Masterclass',
              'Scam Awareness Quiz',
            ],
            contents: [
              'Uncover the Deceptions!',
              'Know Your Fraud Types!',
              'Can You Identify the Red Flags?',
              'How Well Do You Understand Financial Scams?',
              'Can You Tell Fact from Fiction?',
              'Are You Scam Savvy?',
              'How Well-Informed Are You?',
            ],
          ),
        ],
      ),
    );
  }
}

class Flashcards extends StatelessWidget {
  final List<String> titles;
  final List<String> contents;

  Flashcards({required this.titles, required this.contents});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: titles.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FlashCardPage()),
              );
            }
          },
          child: Card(
            color: Colors.white,
            elevation: 2,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: Image.network(
                      'https://play-lh.googleusercontent.com/ChRlrpTSBGoCIKSn-BmfCsqXr8qMElonAmetgBTJfnO6j-3s20jNdEuMNhufP91KXNc',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          titles[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          contents[index],
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class Quiz extends StatelessWidget {
  final List<String> titles;
  final List<String> contents;

  Quiz({required this.titles, required this.contents});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: titles.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuizPage()),
              );
            }
          },
          child: Card(
            color: Colors.white,
            elevation: 2,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: Image.network(
                      'https://img.freepik.com/premium-vector/quiz-logo-with-speech-bubble-icon_149152-813.jpg?w=826',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          titles[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          contents[index],
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
