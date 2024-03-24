import 'package:antiscam/Chatbot.dart';
import 'package:antiscam/FlashcardQuiz.dart';
import 'package:antiscam/Insights.dart';
import 'package:antiscam/Login.dart';
import 'package:antiscam/Profile.dart';
import 'package:antiscam/RankingHeader.dart';
import 'package:antiscam/RewardsPoints.dart';
import 'package:antiscam/ViewReport.dart';
import 'package:antiscam/WatchAds.dart';
import 'package:flutter/material.dart';
import 'AddReport.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: HomePage(),
      routes: {
        '/chat': (context) => ChatApp(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FocusNode _focusNode = FocusNode();
  bool _isSearchVisible = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus) {
      setState(() {
        _isSearchVisible = false;
      });
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  int _selectedIndex = 0;
  List<Map<String, String>> cardData = [
    {
      'imageAsset': 'assets/Xaroucell.jpg',
      'category': 'E-Commerce Scam',
      'title': 'Scam on Xaroucell',
      'date': '16/3/2024',
    },
    {
      'imageAsset': 'assets/cleany.png',
      'category': 'Malware Scam',
      'title': 'Apk scam on MaidCleany',
      'date': '20/3/2024',
    },
    {
      'imageAsset': 'assets/paypaladin.jpg',
      'category': 'Phishing Attempt',
      'title': 'Phishing attack on Pay Paladin',
      'date': '25/3/2024',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Image.asset(
            'assets/SH_logo.png',
            height: 60,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: 43.0,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextField(
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: const TextStyle(fontSize: 12),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.search, color: Colors.black),
                      onPressed: () {},
                    ),
                  ),
                  autofocus: _isSearchVisible,
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chat, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    PlatformCategoryButton('All'),
                    PlatformCategoryButton('Followed'),
                    PlatformCategoryButton('PicGram'),
                    PlatformCategoryButton('FaceSpace'),
                    PlatformCategoryButton('Chirper'),
                    PlatformCategoryButton('Vendoza'),
                    PlatformCategoryButton('Shopsea'),
                    PlatformCategoryButton('Xrocell'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.bookmark_outline,
                            size: 40, color: Colors.purple.shade300),
                        const SizedBox(height: 4),
                        const SizedBox(
                          width: 100,
                          height: 40,
                          child: Text('Flashcard', textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to the desired page here
                        // For example:
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FlashcardQuiz()),
                        );
                      },
                      child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.quiz_outlined,
                            size: 40, color: Colors.purple.shade300),
                        const SizedBox(height: 4),
                        const SizedBox(
                          width: 100,
                          height: 40,
                          child: Text('Quiz', textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to the desired page here
                        // For example:
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WatchAds()),
                        );
                      },
                      child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.slideshow_outlined,
                            size: 40, color: Colors.purple.shade300),
                        const SizedBox(height: 4),
                        const SizedBox(
                          width: 100,
                          height: 40,
                          child: Text('Watch ads', textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigate to the desired page here
                        // For example:
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => InsightsPage()),
                        );
                      },
                      child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.wb_incandescent_outlined,
                            size: 40, color: Colors.purple.shade300),
                        const SizedBox(height: 4),
                        const SizedBox(
                          width: 100,
                          height: 40,
                          child: Text('Scam insights',
                              textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.redeem_outlined,
                            size: 40, color: Colors.purple.shade300),
                        const SizedBox(height: 4),
                        const SizedBox(
                          width: 100,
                          height: 40,
                          child: Text('Rewards Redemption',
                              textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.more_outlined,
                            size: 40, color: Colors.purple.shade300),
                        const SizedBox(height: 4),
                        const SizedBox(
                          width: 100,
                          height: 40,
                          child:
                              Text('Learn More', textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 50.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Latest Fraud Cases',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'View all >>',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  cardData.length,
                  (index) => SizedBox(
                    width: 330,
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          cardData[index]['imageAsset']!),
                                      width: 40.0,
                                      height: 40.0,
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      child: Text(
                                        cardData[index]['category']!,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  cardData[index]['date']!,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black45,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              cardData[index]['title']!,
                              style: const TextStyle(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Weekly Report',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'View all >>',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewReport()),
                );
              },
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Image(
                            image: AssetImage('assets/Xaroucell.jpg'),
                            width: 40.0,
                            height: 40.0,
                          ),
                          const SizedBox(width: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: const Text(
                              'E-Commerce Scam',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text('Scam on Xaroucell',
                          style: TextStyle(
                              fontSize: 14.5,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87)),
                      const SizedBox(height: 8),
                      const Row(
                        children: [
                          Spacer(),
                          Text(
                            '16/3/2024',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.black45),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Image(
                          image: AssetImage('assets/cleany.png'),
                          width: 40.0,
                          height: 40.0,
                        ),
                        const SizedBox(width: 8),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: const Text(
                            'Malware Scam',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text('APK scam on MaidCleany',
                        style: TextStyle(
                            fontSize: 14.5,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87)),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        Spacer(),
                        Text(
                          '12/3/2024',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.black45),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Image(
                          image: AssetImage('assets/paypaladin.jpg'),
                          width: 40.0,
                          height: 40.0,
                        ),
                        const SizedBox(width: 8),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: const Text(
                            'Phishing',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text('Phishing attack on Pay Paladin',
                        style: TextStyle(
                            fontSize: 14.5,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87)),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        Spacer(),
                        Text(
                          '2/2/2024',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.black45),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Monthly Report',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'View all >>',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewReport()),
                );
              },
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Image(
                            image: AssetImage('assets/Xaroucell.jpg'),
                            width: 40.0,
                            height: 40.0,
                          ),
                          const SizedBox(width: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: const Text(
                              'E-Commerce Scam',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text('Scam on Xaroucell',
                          style: TextStyle(
                              fontSize: 14.5,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87)),
                      const SizedBox(height: 8),
                      const Row(
                        children: [
                          Spacer(),
                          Text(
                            '16/3/2024',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.black45),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Image(
                          image: AssetImage('assets/cleany.png'),
                          width: 40.0,
                          height: 40.0,
                        ),
                        const SizedBox(width: 8),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: const Text(
                            'Malware Scam',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text('APK scam on MaidCleany',
                        style: TextStyle(
                            fontSize: 14.5,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87)),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        Spacer(),
                        Text(
                          '12/3/2024',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.black45),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Image(
                          image: AssetImage('assets/paypaladin.jpg'),
                          width: 40.0,
                          height: 40.0,
                        ),
                        const SizedBox(width: 8),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: const Text(
                            'Phishing',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text('Phishing attack on Pay Paladin',
                        style: TextStyle(
                            fontSize: 14.5,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87)),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        Spacer(),
                        Text(
                          '2/2/2024',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.black45),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(color: Colors.black),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.email_outlined,
              color: Colors.black,
            ),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.security, color: Colors.black),
            label: 'Fraud Tracker',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add, color: Colors.black),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard, color: Colors.black),
            label: 'Rewards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RankingHeaderPage()),
        );
      } else if (_selectedIndex == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddReportPage()),
        );
      } else if (_selectedIndex == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RewardsPoints()),
        );
      } else if (_selectedIndex == 4) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Profile()),
        );
      }
    });
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Fraud Types',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                FilterOptionButton('Financial Frauds'),
                FilterOptionButton('Online E-commerce Fraud'),
                FilterOptionButton('Identity Theft'),
                FilterOptionButton('Cybersecurity Threats'),
                const SizedBox(height: 16),
                const Text(
                  'Platforms',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                FilterOptionButton('Instagram'),
                FilterOptionButton('Facebook'),
                const SizedBox(height: 16),
                const Text(
                  'Social Engineering Techniques',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                FilterOptionButton('Phishing'),
                FilterOptionButton('Impersonation'),
                FilterOptionButton('Payment Fraud'),
              ],
            ),
          ),
        );
      },
    );
  }
}

class FilterOptionButton extends StatelessWidget {
  final String option;

  FilterOptionButton(this.option);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child: Text(option),
      ),
    );
  }
}

class PlatformCategoryButton extends StatefulWidget {
  final String title;
  final IconData? icon;

  PlatformCategoryButton(this.title, {this.icon});

  @override
  _PlatformCategoryButtonState createState() => _PlatformCategoryButtonState();
}

class _PlatformCategoryButtonState extends State<PlatformCategoryButton> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _isSelected = !_isSelected;
          });
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) => _isSelected
                ? Colors.grey.shade200
                : const Color.fromARGB(255, 0, 0, 0),
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) => _isSelected ? Colors.black : Colors.white,
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          elevation: MaterialStateProperty.all(0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.icon != null) ...[
              Icon(widget.icon, size: 16),
              const SizedBox(width: 8),
            ],
            Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
