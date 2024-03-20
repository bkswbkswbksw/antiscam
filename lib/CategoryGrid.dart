import 'package:flutter/material.dart';

class ScamCountPage extends StatefulWidget {
  @override
  _ScamCountPageState createState() => _ScamCountPageState();
}

class _ScamCountPageState extends State<ScamCountPage> {
  bool showAllRows = false; // Flag to track if all rows should be shown

  final List<List<String>> scamTypes = [
    ['Phishing', 'Identity Theft'],
    ['Online Shopping', 'Investment'],
    ['Email Scams', 'Fake Charities'],
    ['Lottery Scams', 'Romance Scams'],
    ['Tech Support Scams', 'Credit Card Fraud'],
  ];

  final List<List<int>> scamCounts = [
    [10, 20],
    [15, 8],
    [5, 12],
    [18, 7],
    [8, 14],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scam Counts'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _buildScamRows(),
                SizedBox(height: 16),
                _buildViewMoreInsightsBox(), // Placed "View More Insights" box before "View More" button
                SizedBox(height: 16),
                _buildViewMoreButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScamRows() {
    List<Widget> rows = [];
    int numRowsToShow = showAllRows ? scamTypes.length : 2;

    for (int i = 0; i < numRowsToShow; i++) {
      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            2,
            (index) => SizedBox(
              width: MediaQuery.of(context).size.width / 2 - 16, // Set fixed width for each box
              height: 100, // Set fixed height for each box
              child: Padding(
                padding: const EdgeInsets.all(4.0), // Reduce padding between boxes
                child: _buildScamBox(i, index),
              ),
            ),
          ),
        ),
      );
      rows.add(SizedBox(height: 16));
    }

    return Column(children: rows);
  }

  Widget _buildScamBox(int rowIndex, int colIndex) {
    if (rowIndex >= scamTypes.length ||
        colIndex >= scamTypes[rowIndex].length ||
        rowIndex >= scamCounts.length ||
        colIndex >= scamCounts[rowIndex].length) {
      return SizedBox(); // Return an empty widget if index is out of range
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.lightBlue[100], // Set background color to red[100]
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              scamTypes[rowIndex][colIndex],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              '${scamCounts[rowIndex][colIndex]}', // Display the count of the scam type
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildViewMoreButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          showAllRows = true; // Toggle to show all rows
        });
      },
      child: Text('View More'),
    );
  }

  Widget _buildViewMoreInsightsBox() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SecondPage()),
        );
      },
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.red[100],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            'View More Insights',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Text('Second Page Content'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ScamCountPage(),
  ));
}
