import 'package:antiscam/Chatbot.dart';
import 'package:antiscam/Profile.dart';
import 'package:antiscam/RankingHeader.dart';
import 'package:antiscam/RewardsPoints.dart';
import 'package:antiscam/ViewReport.dart';
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
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: PreferredSize(
        //   preferredSize: Size(48, 48), 
        //   child: IconButton(
        //     icon: Icon(Icons.menu), 
        //     onPressed: () {
        //       //function
        //     },
        //   ),
        // ),
        actions: [
          IconButton(
            icon: Icon(Icons.email_outlined),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => ChatPage()),
              // );            
            },
          ),
          Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              height: 43.0, 
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(fontSize: 12),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
            ),
          ),
        ),

          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              _showFilterBottomSheet(context); 
            },
          ),
          IconButton(
            icon: Icon(Icons.chat),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatPage()),
              );            },
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
                    PlatformCategoryButton('Instagram'),
                    PlatformCategoryButton('Facebook'),
                    PlatformCategoryButton('Twitter'),
                    PlatformCategoryButton('Lazada'),
                    PlatformCategoryButton('Shopee'),
                    PlatformCategoryButton('Carousell'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Text(
                    'Latest Fraud Cases',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                        onPressed: () {
                          // function
                        },
                        child: Text(
                          'View All >',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
            ),
            SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewReport()),
                  );
                },
                child: Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image(
                            image: AssetImage('assets/Xaroucell.jpg'), 
                            width: 40.0, 
                            height: 40.0, 
                          ),
                          SizedBox(width: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red, 
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), 
                            child: Text(
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
                      SizedBox(height: 8),
                      Text('Scam on Xaroucell',
                      style:TextStyle(
                        fontSize: 14.5, 
                        fontWeight: FontWeight.bold, 
                        color: Colors.black87
                      )
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Spacer(), 
                          Text('16/3/2024', 
                          style: TextStyle(
                            fontSize: 12, 
                            fontWeight: FontWeight.normal, 
                            color: Colors.black45
                          ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ),

              Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image(
                            image: AssetImage('assets/cleany.png'), 
                            width: 40.0, 
                            height: 40.0, 
                          ),
                          SizedBox(width: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red, 
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), 
                            child: Text(
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
                      SizedBox(height: 8),
                      Text('APK scam on MaidCleany',
                      style:TextStyle(
                        fontSize: 14.5, 
                        fontWeight: FontWeight.bold, 
                        color: Colors.black87
                      )
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Spacer(), 
                          Text('12/3/2024', 
                          style: TextStyle(
                            fontSize: 12, 
                            fontWeight: FontWeight.normal, 
                            color: Colors.black45
                          ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image(
                            image: AssetImage('assets/paypaladin.jpg'), 
                            width: 40.0, 
                            height: 40.0, 
                          ),
                          SizedBox(width: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red, 
                              borderRadius: BorderRadius.circular(8), 
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), 
                            child: Text(
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
                      SizedBox(height: 8),
                      Text('Phishing attack on Pay Paladin',
                      style:TextStyle(
                        fontSize: 14.5, 
                        fontWeight: FontWeight.bold, 
                        color: Colors.black87
                      )
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Spacer(), 
                          Text('2/2/2024', 
                          style: TextStyle(
                            fontSize: 12, 
                            fontWeight: FontWeight.normal, 
                            color: Colors.black45
                          ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Weekly Report',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // function
                        },
                        child: Text(
                          'View All >',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewReport()),
                  );
                },
                child: Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image(
                            image: AssetImage('assets/Xaroucell.jpg'), 
                            width: 40.0, 
                            height: 40.0, 
                          ),
                          SizedBox(width: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red, 
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), 
                            child: Text(
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
                      SizedBox(height: 8),
                      Text('Scam on Xaroucell',
                      style:TextStyle(
                        fontSize: 14.5, 
                        fontWeight: FontWeight.bold, 
                        color: Colors.black87
                      )
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Spacer(), 
                          Text('16/3/2024', 
                          style: TextStyle(
                            fontSize: 12, 
                            fontWeight: FontWeight.normal, 
                            color: Colors.black45
                          ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ),

              Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image(
                            image: AssetImage('assets/cleany.png'), 
                            width: 40.0, 
                            height: 40.0, 
                          ),
                          SizedBox(width: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red, 
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), 
                            child: Text(
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
                      SizedBox(height: 8),
                      Text('APK scam on MaidCleany',
                      style:TextStyle(
                        fontSize: 14.5, 
                        fontWeight: FontWeight.bold, 
                        color: Colors.black87
                      )
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Spacer(), 
                          Text('12/3/2024', 
                          style: TextStyle(
                            fontSize: 12, 
                            fontWeight: FontWeight.normal, 
                            color: Colors.black45
                          ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image(
                            image: AssetImage('assets/paypaladin.jpg'), 
                            width: 40.0, 
                            height: 40.0, 
                          ),
                          SizedBox(width: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red, 
                              borderRadius: BorderRadius.circular(8), 
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), 
                            child: Text(
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
                      SizedBox(height: 8),
                      Text('Phishing attack on Pay Paladin',
                      style:TextStyle(
                        fontSize: 14.5, 
                        fontWeight: FontWeight.bold, 
                        color: Colors.black87
                      )
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Spacer(), 
                          Text('2/2/2024', 
                          style: TextStyle(
                            fontSize: 12, 
                            fontWeight: FontWeight.normal, 
                            color: Colors.black45
                          ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
               
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Monthly Report',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // function
                        },
                        child: Text(
                          'View All >',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewReport()),
                  );
                },
                child: Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image(
                            image: AssetImage('assets/Xaroucell.jpg'), 
                            width: 40.0, 
                            height: 40.0, 
                          ),
                          SizedBox(width: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red, 
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), 
                            child: Text(
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
                      SizedBox(height: 8),
                      Text('Scam on Xaroucell',
                      style:TextStyle(
                        fontSize: 14.5, 
                        fontWeight: FontWeight.bold, 
                        color: Colors.black87
                      )
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Spacer(), 
                          Text('16/3/2024', 
                          style: TextStyle(
                            fontSize: 12, 
                            fontWeight: FontWeight.normal, 
                            color: Colors.black45
                          ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ),

              Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image(
                            image: AssetImage('assets/cleany.png'), 
                            width: 40.0, 
                            height: 40.0, 
                          ),
                          SizedBox(width: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red, 
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), 
                            child: Text(
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
                      SizedBox(height: 8),
                      Text('APK scam on MaidCleany',
                      style:TextStyle(
                        fontSize: 14.5, 
                        fontWeight: FontWeight.bold, 
                        color: Colors.black87
                      )
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Spacer(), 
                          Text('12/3/2024', 
                          style: TextStyle(
                            fontSize: 12, 
                            fontWeight: FontWeight.normal, 
                            color: Colors.black45
                          ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image(
                            image: AssetImage('assets/paypaladin.jpg'), 
                            width: 40.0, 
                            height: 40.0, 
                          ),
                          SizedBox(width: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red, 
                              borderRadius: BorderRadius.circular(8), 
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), 
                            child: Text(
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
                      SizedBox(height: 8),
                      Text('Phishing attack on Pay Paladin',
                      style:TextStyle(
                        fontSize: 14.5, 
                        fontWeight: FontWeight.bold, 
                        color: Colors.black87
                      )
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Spacer(), 
                          Text('2/2/2024', 
                          style: TextStyle(
                            fontSize: 12, 
                            fontWeight: FontWeight.normal, 
                            color: Colors.black45
                          ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ],
            ),
          ],
        ),
        
      ),
      

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.black, 
          unselectedItemColor: Colors.grey, 
          selectedLabelStyle: TextStyle(color: Colors.black),        
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black,),
              label: 'Home',
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
      } 
      else if (_selectedIndex == 2) {
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
            padding: EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width, 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fraud Types',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                FilterOptionButton('Financial Frauds'),
                FilterOptionButton('Online E-commerce Fraud'),
                FilterOptionButton('Identity Theft'),
                FilterOptionButton('Cybersecurity Threats'),

                SizedBox(height: 16),
                Text(
                  'Platforms',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                FilterOptionButton('Instagram'),
                FilterOptionButton('Facebook'),

                SizedBox(height: 16),
                Text(
                  'Social Engineering Techniques',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
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
      margin: EdgeInsets.symmetric(vertical: 4),
      child: ElevatedButton(
        onPressed: () {
          // functionality
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.black, 
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

  PlatformCategoryButton(this.title);

  @override
  _PlatformCategoryButtonState createState() => _PlatformCategoryButtonState();
}

class _PlatformCategoryButtonState extends State<PlatformCategoryButton> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: ElevatedButton(
        
        onPressed: () {
          setState(() {
            _isSelected = !_isSelected;
          });
          
        },
        style: ButtonStyle(
          
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.selected)) {
              return Colors.white; 
            }
            else {
              return Colors.black; 
            }
            
          }),
        ),
        child: Text(
          widget.title,
          style: TextStyle(
            color: _isSelected ? Colors.black : Colors.white, 
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
