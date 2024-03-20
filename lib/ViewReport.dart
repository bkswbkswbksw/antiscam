import 'package:flutter/material.dart';

void main() {
  runApp(ViewReport());
}

class ViewReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue, 
      ),
      home: QuestionPage(),
    );
  }
}

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  late int _currentPanelIndex;
  final String questionContent =
      'I purchased a PS5 from a Carousell seller last Saturday, and paid via bank transfer (RM 2780 in total). It was kinda my fault I guess that I didn’t ask for her IC or anything, just asked for a video of her with a piece of paper writing my username and hers on the box of the PS5.\n\nShe sent me the video on WhatsApp, and then I made the payment and sent her the receipt on Carousell. She then promised to ship it on Monday and it was already nighttime, and Sunday she said the kiosk she hantar stuff is closed.\n\nMonday she sent me a pic of the DHL shipment slip. Tried tracking it but didn\'t get anything. So I waited. Tuesday was a public holiday so I assumed memang cannot ada update on shipping. I waited till Wednesday evening and still nothing on the tracking number. So I texted her asking “hey you sure you shipped it?” And about an hour or two later (she tends to disappear a lot which made me feel super uneasy all throughout), her dp disappeared, and all my texts were single ticks. I asked my sis to check her number on WhatsApp and the dp and status were still there. Which basically means I\'m blocked, and that\'s when it confirmed my suspicions that I was scammed.\n\nPlease skip the “OP is an idiot for not doing COD” or anything, I already feel really down and really sad about this. I just need legitimate advice from anyone that knows what\'s the best course of action to take now. I don\'t have high hopes of getting the money back cause I know it won’t be easy, just wanna get advice on the best thing to do. The only stuff I have on her are her phone number, the bank account (probably not even hers cause she never gave me her real name), her address (also probably fake?, checked Google it\'s a legit address, but probably some rando\'s add), and proof of our agreement for purchase as well my screenshots of all our chats.\n\nThank you so much to anyone that can give me some advice, I really appreciate it 🙏🏼\n\nEDIT\n\nWent to make the report just now, surprisingly it was pretty fast. Need to print out all the evidence now and submit it to the inspector. Thanks again for the advice guys! If there’s anything else that would be good for me to do as well please let me know, thanks!\n\nAlso wanted to add that the police are super pleasant. I feel like the general stuff on the internet talking about the police made me view them in such a bad light but they’re actually really nice. Each officer I talked to just now was very pleasant and was empathizing with me, soo just wanted to get that out here';

  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    _currentPanelIndex = 0;
  }

  final List<String> comments = [
    "Great question!",
    "I have a similar question.",
    "This is really helpful. Thanks!",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Zeyne',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              
                      Row(
                        children: [
                          Image(
                            image: AssetImage('assets/Xaroucell.jpg'), 
                            width: 40.0, 
                            height: 40.0, 
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Scam on Xaroucell',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red, 
                              borderRadius: BorderRadius.circular(8), 
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), 
                            child: Text(
                              'E-Commerce\nScam', 
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10, 
                                fontWeight: FontWeight.bold, 
                              ),
                            ),
                          ),
                        ],
                      ),              
              SizedBox(height: 20.0),
              QuestionCard(
                question: questionContent,
                isExpanded: isExpanded,
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                date: '16/3/2024', 
              ),
              SizedBox(height: 20.0),
              ExpansionPanelListRadioExample(
                panelContents: [
                  PanelContent(
                    title: 'Scammer Information',
                    content: ['mauseller97\n012875687657'],
                  ),
                  PanelContent(
                    title: 'Attachment',
                    content: ['mauseller97.jpg', 'Xaroucell_scam.jpg'],
                  ),
                  PanelContent(
                    title: 'Targeted user demographic',
                    content: ['Novice buyer who is new to the Xaroucell'],
                  ),
                  PanelContent(
                    title: 'Ways to prevent',
                    content: ['1. Cash on delivery/meet up physically\n2. If meet up make sure to check product before paying\n3. Avoid those listings that’s priced too low/below whatever others are listing\n4. Check reviews of seller (look at their 1 star reviews to see if they’ve maybe scammed before long ago but didn’t get banned)\n5. Just personal experience for this but scammers tend to try and close the deal quickly and get a little pushy whereas real sellers just let me take my time to decide'],
                  ),
                ],
              ),
              SizedBox(height: 40.0),
              Text(
                'Comments',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Column(
                children: comments.map((comment) {
                  return CommentCard(
                    respondent: 'Jane Doe',
                    comment: comment,
                    onReply: () {

                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: LeaveCommentSection(),
    );
  }
}

class LeaveCommentSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Leave a comment...',
                hintStyle: TextStyle(fontSize: 12),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          IconButton(
            icon: Icon(Icons.send),
            color: Colors.grey,
            onPressed: () {

            },
          ),
        ],
      ),
    );
  }
}

class CommentCard extends StatefulWidget {
  final String respondent;
  final String comment;
  final VoidCallback? onReply;

  CommentCard({
    required this.respondent,
    required this.comment,
    this.onReply,
  });

  @override
  _CommentCardState createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  int likes = 0;
  bool liked = false;
  bool showReplyBox = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.respondent,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.thumb_up),
                      iconSize: 19,
                      color: liked ? Colors.red : Colors.grey,
                      onPressed: () {
                        setState(() {
                          liked = !liked;
                          if (liked) {
                            likes++;
                          } else {
                            likes--;
                          }
                        });
                      },
                    ),
                    SizedBox(width: 10.0),
                    IconButton(
                      icon: Icon(Icons.reply),
                      color: Colors.grey,
                      onPressed: () {
                        setState(() {
                          showReplyBox = !showReplyBox;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(widget.comment),
            SizedBox(height: 8.0),
            Visibility(
              visible: showReplyBox,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Write a reply...',
                        hintStyle: TextStyle(fontSize: 12),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    color: Colors.grey,
                    onPressed: () {

                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionCard extends StatelessWidget {
  final String question;
  final bool isExpanded;
  final VoidCallback onTap;
  final String date;

  const QuestionCard({
    required this.question,
    required this.isExpanded,
    required this.onTap,
    required this.date, 
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isExpanded ? question : '${question.substring(0, 500)}...',
            ),
            InkWell(
              child: Text(
                isExpanded ? 'View Less' : 'View More',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: onTap,
            ),
            SizedBox(height: 8.0),
          Row(
              children: [
                Spacer(), 
                Text(
                  '$date', 
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PanelContent {
  final String title;
  final List<String> content; 

  PanelContent({required this.title, required this.content});
}

class ExpansionPanelListRadioExample extends StatefulWidget {
  final List<PanelContent> panelContents;

  ExpansionPanelListRadioExample({Key? key, required this.panelContents})
      : super(key: key);

  @override
  State<ExpansionPanelListRadioExample> createState() =>
      _ExpansionPanelListRadioExampleState();
}

class _ExpansionPanelListRadioExampleState
    extends State<ExpansionPanelListRadioExample> {
  late int _currentPanelIndex;

  @override
  void initState() {
    super.initState();
    _currentPanelIndex = -1;
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList.radio(
      initialOpenPanelValue: _currentPanelIndex,
      children: widget.panelContents.map<ExpansionPanelRadio>((panelContent) {
        return ExpansionPanelRadio(
          value: widget.panelContents.indexOf(panelContent),
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(
                panelContent.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
          body: Column(
            children: [
              if (panelContent.title == 'Attachment')
                ...panelContent.content.map<Widget>((imageName) => ListTile(
                      title: Text(
                        imageName,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.blue, 
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      onTap: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                FullImagePage(imageName: imageName),
                          ),
                        );
                      },
                    ))
              else
                ...panelContent.content.map<Widget>((text) => ListTile(
                      title: Text(
                        text,
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ))
            ],
          ),
        );
      }).toList(),
    );
  }
}

class FullImagePage extends StatelessWidget {
  final String imageName;

  const FullImagePage({Key? key, required this.imageName}) : super(key: key);

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
        child: Image.asset('assets/$imageName'),
      ),
    );
  }
}