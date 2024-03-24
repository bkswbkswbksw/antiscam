import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: NotificationsPage(),
  ));
}

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<Map<String, dynamic>> notifications = [
    {
      'title': 'New Message',
      'message': 'You have received a new message from John Doe.',
      'read': false,
      'timestamp': DateTime.now(),
    },
    {
      'title': 'Reminder',
      'message': 'Don\'t forget to attend the meeting at 2:00 PM.',
      'read': true,
      'timestamp': DateTime.now().subtract(Duration(days: 1)),
    },
    {
      'title': 'Event Notification',
      'message': 'Your event "Birthday Party" is coming up tomorrow.',
      'read': false,
      'timestamp': DateTime.now().subtract(Duration(days: 1)),
    },
  ];

  List<Map<String, dynamic>> filteredNotifications = [];

  @override
  void initState() {
    super.initState();
    filteredNotifications = List.from(notifications);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (value) {
              setState(() {
                if (value == 'All') {
                  filteredNotifications = List.from(notifications);
                } else {
                  filteredNotifications = notifications.where((notification) {
                    if (value == 'Today') {
                      return notification['timestamp'].day ==
                          DateTime.now().day;
                    } else if (value == 'Yesterday') {
                      return notification['timestamp'].day ==
                          DateTime.now().subtract(Duration(days: 1)).day;
                    }
                    return true;
                  }).toList();
                }
              });
            },
            itemBuilder: (BuildContext context) {
              return ['All', 'Today', 'Yesterday'].map((option) {
                return PopupMenuItem(
                  value: option,
                  child: Text(option),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredNotifications.length,
        itemBuilder: (context, index) {
          final notification = filteredNotifications[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor:
                  notification['read'] ? Colors.grey[200] : Colors.lightGreen,
              child: Icon(Icons.notifications),
            ),
            title: Text(
              notification['title'],
              style: TextStyle(
                fontWeight:
                    notification['read'] ? FontWeight.normal : FontWeight.bold,
              ),
            ),
            subtitle: Text(
              notification['message'],
              style: TextStyle(
                fontWeight:
                    notification['read'] ? FontWeight.normal : FontWeight.bold,
              ),
            ),
            onTap: () {
              setState(() {
                notification['read'] = true;
              });
            },
          );
        },
      ),
    );
  }
}
