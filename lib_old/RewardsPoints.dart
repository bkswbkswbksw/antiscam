import 'package:antiscam/EarnPoints.dart';
import 'package:antiscam/RewardsRedemption.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(RewardsPoints());
}

class RewardsPoints extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
              'Rewards',
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
bottom: TabBar(
  controller: _tabController,
  tabs: [
    Tab(
      child: Text(
        'Earn Points',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12), 
      ),
    ),
    Tab(
      child: Text(
        'Rewards Redemption',
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
          EarnPoints(),
          RewardsPage(),
        ],
      ),
    );
  }
}
