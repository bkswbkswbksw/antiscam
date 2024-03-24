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
  int totalPoints = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: GradientButton(
                    text: 'Grab Food',
                    description: 'RM15 GrabFood eVoucher',
                    gradientColors: [
                      const Color(0xffa8e063),
                      const Color(0xffEDE574)
                    ],
                    points: 150000,
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: GradientButton(
                    text: 'Shopee',
                    description: 'RM20 Shopee eVoucher',
                    gradientColors: [
                      const Color(0xffa0e6ff),
                      const Color(0xffbac8fb)
                    ],
                    points: 250000,
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: GradientButton(
                    text: 'Touch n Go',
                    description: 'RM20 TnG eWallet Credit',
                    gradientColors: [
                      const Color(0xff8BA3E5),
                      const Color(0xfff9ccff)
                    ],
                    points: 200000,
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: GradientButton(
                    text: 'Prepaid Mobile Credit',
                    description: 'RM30 Prepaid Mobile Credit',
                    gradientColors: [
                      const Color(0xfffbe0ff),
                      const Color(0xfffeb7bf)
                    ],
                    points: 300000,
                    onPressed: () {},
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
  final int points;
  final VoidCallback? onPressed;

  const GradientButton({
    Key? key,
    required this.text,
    required this.description,
    required this.gradientColors,
    required this.points,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
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
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Text(
                          '$points',
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.monetization_on,
                          size: 16,
                          color: Colors.amber,
                        ),
                        const SizedBox(width: 4),
                      ],
                    ),
                  ),
                ],
              ),
              const Icon(
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
