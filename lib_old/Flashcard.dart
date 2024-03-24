import 'package:flutter/material.dart';

class FlashCard extends StatefulWidget {
  final String question;
  final String answer;
  final String? imageUrl; 

  FlashCard({required this.question, required this.answer, this.imageUrl});

  @override
  _FlashCardState createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> {
  bool _showAnswer = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _showAnswer = !_showAnswer;
        });
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.all(16),
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: _showAnswer
              ? _buildAnswerWidget()
              : _buildQuestionWidget(),
        ),
      ),
    );
  }

Widget _buildQuestionWidget() {
  return SizedBox(
    child: Container(
      key: UniqueKey(),
      padding: EdgeInsets.all(16),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.imageUrl != null)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FullScreenImage(imageUrl: widget.imageUrl!), 
                  ),
                );
              },
              child: Image.network(
                widget.imageUrl!,
                height: 100, 
              ),
            ),
          SizedBox(height: 16), 
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 26), 
            child: Text(
              'Question:\n${widget.question}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


  Widget _buildAnswerWidget() {
    return SizedBox(
      child: Container(
        key: UniqueKey(),
        padding: EdgeInsets.all(16),
        alignment: Alignment.center,
        child: RotationTransition(
          turns: AlwaysStoppedAnimation(360 / 360),
          child: Text(
            'Answer:\n${widget.answer}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}

class FlashCardPage extends StatefulWidget {
  @override
  _FlashCardPageState createState() => _FlashCardPageState();
}

class _FlashCardPageState extends State<FlashCardPage> {
  int _currentIndex = 0;
  final List<FlashCard> flashCards = [
    FlashCard(
      question: 'Is this a scam?',
      answer:
          'This is a scam\n' + 

'Banks won’t ask you to confirm personal or financial information via a text, or via a link from a text\n' +

'Banks won’t text you a link to their internet banking log in page, or another page asking for personal details\n' +

'Tip: Never disclose personal or financial information on a website you’ve reached by clicking on a link in a text message. ',
      imageUrl:
          'https://www.independentage.org/sites/default/files/quiz/2.png',
    ),
    FlashCard(
      question: '\"Hello, this is Jayden calling from AA Bank. I\'m just ringing to let you know there has been some suspicious activity on your current account. I need to run through your recent transactions to check that they were actually made by you. I need to confirm who I\'m talking to, so could you tell me your date or birth and confirm what accounts you hold with us?\" \n\nIs this a scam?',
      answer: 'This is not a scam. \nThis is a genuine call of the type banks make when they suspect fraud on your account. They may even use automated voice calls or text alerts to do this. However, be aware of your own bank’s policies and the types of security question they say they will ask you. Banks will usually explain how they will communicate with you on their website, or call or visit them to ask for this information.',
    ),
    FlashCard(
      question: 
                'Look at this irresistible offer! \nWhat would you do?',
      answer:
          'Ignore. \nThis is a Job Scam! \nThey first promise high pay for simple tasks, then vanish after receiving upfront payment for job application or training materials.',
      imageUrl:
          'https://consumer.gov/sites/default/files/pictures/1018-job-ad.jpg', 
    ),

    FlashCard(
      question: 
                'You\'re about to book a cleaning service. To confirm the booking, they ask you to download an unknown app from a link they provided. What would you do? ',
      answer:
          'Ignore. \nThis is a malware scam!\nWhen you download the malware (.APK) file to your phone, a fake payment page may be displayed to steal your banking info.',
      imageUrl:
          'https://media.freemalaysiatoday.com/wp-content/uploads/2022/10/lifestyle-whatsapp-emel-pic-191022.jpg', // Add image URL for specific card
    ),
    
    FlashCard(
      question: 
'You turn on your computer and a box pops up telling you updates are available for your computer with a box saying \'Install updates\'.\nIs this a scam?',      answer:
          'This is not a scam. \nThis is a genuine message of the type most computers will generate when you need to update your software or operating system. However, fake software updates do exist and could install damaging software on your computer if you download them. Update notifications won’t come to you in an email link and be suspicious of notifications that pop up when you’re just browsing the internet rather than coming from the software itself.',
      imageUrl:
          'https://www.independentage.org/sites/default/files/quiz/7.png', 
    ),

        FlashCard(
      question: 'Is this a scam?',      
      answer:
          'This is not a scam. \nThis is a genuine email of the type email providers or other companies send you for security purposes to let you know when someone has logged into, or changed details in, your account. Most of the time this will be you, but it can alert you if someone else is trying to access your account.',
      imageUrl:
          'https://www.independentage.org/sites/default/files/quiz/7.png', 
    ),

            FlashCard(
      question: 'Is this a scam?',      
      answer:
          'This is a scam. \n1. Fake recipient name\n2. Clickable hyperlink\n3. Using pressure tactics',
      imageUrl:
          'https://assets-global.website-files.com/5e5ff4f0165cd367cc7ca88f/6009f5332b589bbe3dcfcc5a_Screen%20Shot%202020-11-24%20at%205.40.57%20PM.png',
    ),

    
            FlashCard(
      question: 'Is this a scam?',      
      answer:
            'This is a scam. \n1. Malware (.APK) files are sent via email or chat links. \n2. Clicking the file prompts you to download an app. \n3. The app requests device monitoring permissions. \n4. Granting access allows scammers control, risking your banking info. \n5. A fake payment page may steal your credentials.',
      imageUrl:
          'https://img.stomp.com.sg/s3fs-public/images/2023/07/antiscam.jpg',
    ),
  ];

  void _nextCard() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % flashCards.length;
    });
  }

  void _previousCard() {
    setState(() {
      _currentIndex = (_currentIndex - 1) % flashCards.length;
      if (_currentIndex < 0) {
        _currentIndex = flashCards.length - 1;
      }
    });
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'FlashCard',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Text(
                        '100',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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

      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Center(
                  child: flashCards[_currentIndex],
                ),
                Positioned(
                  left: 0,
                  top: MediaQuery.of(context).size.height * 0.4,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: _previousCard,
                  ),
                ),
                Positioned(
                  right: 0,
                  top: MediaQuery.of(context).size.height * 0.4, 
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: _nextCard,
                  ),
                ),
              ],
            ),
          ),
        ],
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
  double _scale = 0.5;
  double _previousScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white), 
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    backgroundColor: Colors.black,
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
                  width: 300,
                  height: 400, 
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: FlashCardPage(),
  ));
}
