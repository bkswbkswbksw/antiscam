import 'package:flutter/material.dart';

void main() {
  runApp(Profile());
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Profile',
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final String username = "Penelope Johnson";
  final String level = "Innocent";
  final int points = 100;

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Profile',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
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
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        color: Colors.blue,
                        child: const Center(
                          child: Text(
                            'PJ',
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.black,
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                username,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Anti-Scammer',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 5),
                  Image.asset(
                    'assets/goldCrown.png',
                    width: 30,
                    height: 30,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/update_profile'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text('Edit Profile',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 20),
              ProfileMenuWidget(
                  title: "My reports", icon: Icons.report, onPress: () {}),
              ProfileMenuWidget(
                  title: "Settings", icon: Icons.settings, onPress: () {}),
              ProfileMenuWidget(
                  title: "User Management", icon: Icons.group, onPress: () {}),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),
              ProfileMenuWidget(
                  title: "Information", icon: Icons.info, onPress: () {}),
              ProfileMenuWidget(
                  title: "Logout",
                  icon: Icons.logout,
                  textColor: Colors.red,
                  onPress: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final Color? textColor;

  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 20),
            Text(
              title,
              style: TextStyle(
                  color: textColor ??
                      Theme.of(context).textTheme.bodyText1?.color),
            ),
          ],
        ),
      ),
    );
  }
}
