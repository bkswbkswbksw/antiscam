import 'package:flutter/material.dart';

class HorizontalScrollButtonsPage extends StatefulWidget {
  @override
  _HorizontalScrollButtonsPageState createState() =>
      _HorizontalScrollButtonsPageState();
}

class _HorizontalScrollButtonsPageState
    extends State<HorizontalScrollButtonsPage> {
  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Horizontal Scroll Buttons'),
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
      margin: const EdgeInsets.only(right: 8),
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

class RankingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildRankingTile(1, 'John Doe', 'Gold Medal', Icons.emoji_events,
                Colors.amber, 4.8, 2),
            const SizedBox(height: 16),
            _buildRankingTile(2, 'Jane Smith', 'Silver Medal',
                Icons.emoji_events, Colors.grey, 4.5, -1),
            const SizedBox(height: 16),
            _buildRankingTile(3, 'Alice Johnson', 'Bronze Medal',
                Icons.emoji_events, Colors.brown, 4.3, 0),
            const SizedBox(height: 16),
            _buildRankingTile(4, 'Bob Brown', '', null, null, 4.0, 0),
            const SizedBox(height: 16),
            _buildRankingTile(5, 'Emily Wilson', '', null, null, 3.9, 3),
            const SizedBox(height: 16),
            _buildRankingTile(6, 'Michael Lee', '', null, null, 3.8, -2),
          ],
        ),
      ),
    );
  }

  Widget _buildRankingTile(int rank, String name, String subtitle,
      IconData? iconData, Color? iconColor, double rating, int rankChange) {
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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
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
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (subtitle.isNotEmpty) const SizedBox(height: 4),
                if (subtitle.isNotEmpty)
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                const SizedBox(height: 8),
                if (statusIcon != null)
                  Row(
                    children: [
                      Icon(
                        statusIcon,
                        color: statusColor,
                        size: 20,
                      ),
                      const SizedBox(width: 4),
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
                  const Icon(
                    Icons.remove,
                    color: Colors.grey,
                    size: 20,
                  ),
              ],
            ),
          ),
          if (iconData != null) Icon(iconData, color: iconColor, size: 30),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 20),
              const SizedBox(height: 4),
              Text(
                rating.toString(),
                style: const TextStyle(
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
