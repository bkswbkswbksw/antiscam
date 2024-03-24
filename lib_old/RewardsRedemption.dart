
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    home: RewardsPage(),
  ));
}

class RewardsPage extends StatefulWidget {
  @override
  _RewardsPageState createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  int totalPoints = 100; // Sample total collected points

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Text(
      //         'Rewards Redemption',
      //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //       ),
      //       Row(
      //         children: [
      //           Container(
      //             padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      //             decoration: BoxDecoration(
      //               color: Colors.grey[200],
      //               borderRadius: BorderRadius.circular(8),
      //             ),
      //             child: Row(
      //               children: [
      //                 Text(
      //                   '$totalPoints',
      //                   style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      //                 ),
      //                 SizedBox(width: 4),
      //                 Icon(
      //                   Icons.monetization_on,
      //                   size: 16,
      //                   color: Colors.amber, // Set color to gold-like color
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
      body: Builder(
        builder: (context) => Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: GradientButton(
                    text: 'Grab Food',
                    description: 'RM15 GrabFood eVoucher',
                    gradientColors: [Color(0xffa8e063), Color(0xffEDE574)],
                    points: 1500, // Add points value
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => LinearScaleQna(),
                      //   ),
                      // );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: GradientButton(
                    text: 'Shopee',
                    description: 'RM20 Shopee eVoucher',
                    gradientColors: [Color(0xffa0e6ff), Color(0xffbac8fb)],
                    points: 2500, // Add points value
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => LinearScaleQna(),
                      //   ),
                      // );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: GradientButton(
                    text: 'Touch n Go',
                    description: 'RM20 TnG eWallet Credit',
                    gradientColors: [Color(0xfffbe0ff), Color(0xfffeb7bf)],
                    points: 2500, // Add points value
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => LinearScaleQna(),
                      //   ),
                      // );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: GradientButton(
                    text: 'Prepaid Mobile Credit',
                    description: 'RM30 Prepaid Mobile Credit',
                    gradientColors: [Color(0xff8BA3E5), Color(0xfff9ccff)],
                    points: 4000, // Add points value
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => LinearScaleQna(),
                      //   ),
                      // );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  final String text;
  final String description;
  final List<Color> gradientColors;
  final int points; // Add points parameter
  final VoidCallback? onPressed;

  const GradientButton({
    Key? key,
    required this.text,
    required this.description,
    required this.gradientColors,
    required this.points, // Make points required
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Text(
                          '$points',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.monetization_on,
                          size: 16,
                          color: Colors.amber,
                        ),
                        SizedBox(width: 4),
                      ],
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
