import 'package:flutter/material.dart';

class HorizontalScrollButtonsPage extends StatefulWidget {
  @override
  _HorizontalScrollButtonsPageState createState() =>
      _HorizontalScrollButtonsPageState();
}

class _HorizontalScrollButtonsPageState
    extends State<HorizontalScrollButtonsPage> {
  String selectedCategory = 'All';

List<Map<String, dynamic>> stockData = [
  {
    'rank': 1,
    'name': 'Company A',
    'subtitle': 'Stock A',
    'iconData': Icons.attach_money,
    'iconColor': Colors.green,
    'rating': 4.5,
    'rankChange': 2,
  },
  {
    'rank': 2,
    'name': 'Company B',
    'subtitle': 'Stock B',
    'iconData': Icons.attach_money,
    'iconColor': Colors.red,
    'rating': 4.3,
    'rankChange': -1,
  },
  // Add more stock data as needed
];

List<Map<String, dynamic>> cryptoData = [
  {
    'rank': 1,
    'name': 'Bitcoin',
    'subtitle': 'BTC',
    'iconData': Icons.monetization_on,
    'iconColor': Colors.amber,
    'rating': 4.8,
    'rankChange': 2,
  },
  {
    'rank': 2,
    'name': 'Ethereum',
    'subtitle': 'ETH',
    'iconData': Icons.monetization_on,
    'iconColor': Colors.grey,
    'rating': 4.5,
    'rankChange': -1,
  },
  // Add more cryptocurrency data as needed
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horizontal Scroll Buttons'),
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
            if (selectedCategory == 'Stock')
              RankingPage(
                category: 'Stock',
                data: stockData,
              ),
            if (selectedCategory == 'Cryptocurrency')
              RankingPage(
                category: 'Cryptocurrency',
                data: cryptoData,
              ),
            // Add more conditions to display content based on selected category
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
                return Colors.white; // Color when selected
              } else {
                return Colors.black; // Default color
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

class RankingPage extends StatelessWidget {
  final String category;
  final List<Map<String, dynamic>> data;

  RankingPage({
    required this.category,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var item in data)
              _buildRankingTile(
                item['rank'],
                item['name'],
                item['subtitle'],
                item['iconData'],
                item['iconColor'],
                item['rating'],
                item['rankChange'],
              ),
          ],
        ),
      ),
    );
  }

Widget _buildRankingTile(int rank, String name, String subtitle, IconData? iconData, Color? iconColor, double rating, int rankChange) {
  IconData? statusIcon;
  Color? statusColor;
  String rankChangeText;
  if (rankChange > 0) {
    statusIcon = Icons.arrow_upward;
    statusColor = Colors.green;
    rankChangeText = '+$rankChange';
  } else if (rankChange < 0) {
    statusIcon = Icons.arrow_downward;
    statusColor = Colors.red;
    rankChangeText = rankChange.toString();
  } else {
    rankChangeText = '-';
  }
  return Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue.withOpacity(0.3),
          ),
          child: Center(
            child: Text(
              rank.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.blue,
              ),
            ),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (subtitle.isNotEmpty) SizedBox(height: 4),
              if (subtitle.isNotEmpty)
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              SizedBox(height: 8),
              if (statusIcon != null)
                Row(
                  children: [
                    Icon(
                      statusIcon,
                      color: statusColor,
                      size: 20,
                    ),
                    SizedBox(width: 4),
                    Text(
                      rankChangeText,
                      style: TextStyle(
                        fontSize: 14,
                        color: statusColor,
                      ),
                    ),
                  ],
                ),
              if (statusIcon == null)
                Icon(
                  Icons.remove,
                  color: Colors.grey,
                  size: 20,
                ),
            ],
          ),
        ),
        if (iconData != null) Icon(iconData, color: iconColor, size: 30),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(Icons.star, color: Colors.amber, size: 20),
            SizedBox(height: 4),
            Text(
              rating.toString(),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
}


void main() {
  runApp(MaterialApp(
    home: HorizontalScrollButtonsPage(),
  ));
}
