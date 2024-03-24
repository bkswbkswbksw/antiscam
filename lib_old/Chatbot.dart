import 'package:flutter/material.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Bot',
      home: ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController _textEditingController = TextEditingController();
  List<Map<String, dynamic>> faqList = [
    {
      'category': 'Financial Fraud /Scam',
      'questions': [
        'What is financial fraud?',
        'What is financial scam?',
      ]
    },
    {
      'category': 'Types of Fraud / Scam',
      'questions': [
        'Macau Scam',
        'Mobile Application Scam',
        'Mule Account Scam',
        'Phishing'
      ]
    },
    {
      'category': 'Scam Prevention',
      'questions': [
        'Personal Banking Information',
        'Malicious Malware',
        'Cyber Criminals',
        'More ...'
      ]
    },
    {
      'category': 'Scam Response Plan',
      'questions': [
        'Bank Scam Hotline',
        'NSRC',
        'Police Report',
      ]
    },
  ];

  List<String> questionTypes = ['Phishing', 'Macau Scams', 'Mule Account Scams', 'Loan Scams', 'Love Scams', 'Investment Scams'];

  List<Widget> _buildFaqCategories() {
    List<Widget> categories = [];

    categories.add(
      Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Text(
          'Frequently Asked Questions : ',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    for (var category in faqList) {
      categories.add(_buildCategoryTile(category));
    }

    return categories;
  }

  Widget _buildCategoryTile(Map<String, dynamic> category) {
    return ListTile(
      title: Text(category['category'],
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500), 
    ),
      onTap: () {
        print('Category clicked: ${category['category']}');
      },
    );
  }

  void _sendMessage(String message) {
    setState(() {
      _textEditingController.clear();
    });
  }

  Widget _buildQuestionButton(String questionType) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        onPressed: () {
          _textEditingController.text = questionType;
        },
        child: Text(questionType),
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          onPrimary: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat Bot',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(height: 8),
                    Column(
                      children: _buildFaqCategories(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: 8),
                for (var questionType in questionTypes) _buildQuestionButton(questionType),
              ],
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10), 
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      hintStyle: TextStyle(fontSize: 14), 
                    ),
                  ),
                ),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    if (_textEditingController.text.isNotEmpty) {
                      _sendMessage(_textEditingController.text);
                    }
                  },
                  child: Icon(Icons.send, color: Colors.black87),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
