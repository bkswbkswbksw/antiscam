import 'package:flutter/material.dart';
import 'Ranking.dart';

class RankingHeaderPage extends StatefulWidget {
  @override
  _RankingHeaderPageState createState() => _RankingHeaderPageState();
}

class _RankingHeaderPageState extends State<RankingHeaderPage> {
  String selectedCategory = 'All';

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
              'Ranking',
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
                    PlatformCategoryButton('Stock'),
                    PlatformCategoryButton('Cryptocurrency'),
                    PlatformCategoryButton('Forex'),
                    PlatformCategoryButton('Credit Card'),
                    PlatformCategoryButton('Banking'),
                    PlatformCategoryButton('Online Payment'),
                  ],
                ),
              ),
            ),
            if (selectedCategory == 'All') RankingPage(),
          ],
        ),
      ),
    );
  }

  Widget PlatformCategoryButton(String title) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedCategory = title;
          });
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) {
              if (selectedCategory == title) {
                return Colors.white;
              } else {
                return Colors.black;
              }
            },
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: selectedCategory == title ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RankingHeaderPage(),
  ));
}
