import 'package:flutter/material.dart';

class RankingPage extends StatefulWidget {
  @override
  _RankingPageState createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  List<RankingTileData> rankingTiles = [
    RankingTileData(1, 'Trade Trax', 'Gold Medal', Icons.emoji_events, Colors.amber, 4.8, 2),
    RankingTileData(2, 'Token Trend', 'Silver Medal', Icons.emoji_events, Colors.grey, 4.5, -1),
    RankingTileData(3, 'Forex Frontier', 'Bronze Medal', Icons.emoji_events, Colors.brown, 4.3, 0),
    RankingTileData(4, 'Secure Swipe', '', null, null, 4.0, 0),
    RankingTileData(5, 'Money Mastery', '', null, null, 3.7, 3),
    RankingTileData(6, 'Pay Paladin', '', null, null, 2.5, 2),
    RankingTileData(7, 'Market Mastery', '', null, null, 2.3, 1),
    RankingTileData(8, 'Trade Trax', '', null, null, 1.9, -2),
    RankingTileData(9, 'Coin Cloud', '', null, null, 1.8, -1),
    RankingTileData(10, 'Currency Chase', '', null, null, 1.4, -3),

  ];

  @override
  Widget build(BuildContext context) {
    // Sort ranking tiles based on rating
    rankingTiles.sort((a, b) => b.rating.compareTo(a.rating));

    return 
    // Scaffold(
    //   appBar: AppBar(
    //     title: Text('Ranking'),
    //   ),
    //   body: 
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: rankingTiles
                .map((tile) => _buildRankingTile(tile))
                .toList(),
          ),
        ),
      // ),
    );
  }

  Widget _buildRankingTile(RankingTileData tileData) {
    IconData? statusIcon;
    Color? statusColor;
    String rankChangeText;
    if (tileData.rankChange > 0) {
      statusIcon = Icons.arrow_upward;
      statusColor = Colors.green;
      rankChangeText = '+${tileData.rankChange}';
    } else if (tileData.rankChange < 0) {
      statusIcon = Icons.arrow_downward;
      statusColor = Colors.red;
      rankChangeText = tileData.rankChange.toString();
    } else {
      rankChangeText = '-';
    }

    // Check if rating is 2.0 or below
    Color tileColor = tileData.rating <= 2.0 ? Colors.red[100]! : Colors.white;

    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: tileColor,
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
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue.withOpacity(0.3),
            ),
            child: Center(
              child: Text(
                tileData.rank.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
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
                  tileData.name,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (tileData.subtitle.isNotEmpty) SizedBox(height: 4),
                if (tileData.subtitle.isNotEmpty)
                  Text(
                    tileData.subtitle,
                    style: TextStyle(
                      fontSize: 12,
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
                          fontSize: 12,
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
          if (tileData.iconData != null)
            Icon(tileData.iconData, color: tileData.iconColor, size: 30),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(Icons.star, color: Colors.amber, size: 20),
              SizedBox(height: 4),
              Text(
                tileData.rating.toString(),
                style: TextStyle(
                  fontSize: 10,
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

class RankingTileData {
  final int rank;
  final String name;
  final String subtitle;
  final IconData? iconData;
  final Color? iconColor;
  final double rating;
  final int rankChange;

  RankingTileData(
    this.rank,
    this.name,
    this.subtitle,
    this.iconData,
    this.iconColor,
    this.rating,
    this.rankChange,
  );
}

void main() {
  runApp(MaterialApp(
    home: RankingPage(),
  ));
}
