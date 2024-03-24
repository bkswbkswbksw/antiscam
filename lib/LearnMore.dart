import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ScamCategoriesPage(),
  ));
}

class ScamCategoriesPage extends StatelessWidget {
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
              'Learn More',
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
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 20.0,
          children: [
            _buildCategoryTile(
              title: 'Phone Scams',
              image: 'assets/phone_scams.png',
            ),
            _buildCategoryTile(
              title: 'Malware Scams',
              image: 'assets/malware_scams.png',
            ),
            _buildCategoryTile(
              title: 'Job Scams',
              image: 'assets/job_scams.png',
            ),
            _buildCategoryTile(
              title: 'Phishing',
              image: 'assets/phishing.png',
            ),
            _buildCategoryTile(
              title: 'Mule Account Scams',
              image: 'assets/mule_account_scams.png',
            ),
            _buildCategoryTile(
              title: 'E-Commerce Scams',
              image: 'assets/ecommerce_scams.png',
            ),
            _buildCategoryTile(
              title: 'Investment Scams',
              image: 'assets/investment_scams.png',
            ),
            _buildCategoryTile(
              title: 'Cash Reward Scams',
              image: 'assets/cash_reward_scams.png',
            ),
            _buildCategoryTile(
              title: 'Loan Scams',
              image: 'assets/loan_scams.png',
            ),
            _buildCategoryTile(
              title: 'Love Schemes',
              image: 'assets/love_scams.png',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTile({required String title, required String image}) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                ),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
