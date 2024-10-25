import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the home screen
          },
        ),
        title: Text('Notifications', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          NotificationTile(
            title: 'Flight Reminder',
            message: 'Your flight to Cairo departs in 2 hours.',
            timestamp: '2 minutes ago',
            icon: Icons.flight_takeoff,
          ),
          NotificationTile(
            title: 'Booking Confirmed',
            message: 'Your hotel in Luxor is confirmed.',
            timestamp: '1 hour ago',
            icon: Icons.hotel,
          ),
          NotificationTile(
            title: 'Excursion Alert',
            message: 'Your Nile cruise starts tomorrow at 10 AM.',
            timestamp: '3 hours ago',
            icon: Icons.directions_boat,
          ),
          NotificationTile(
            title: 'Special Offer',
            message: 'Get 20% off on your next trip to Egypt!',
            timestamp: '5 hours ago',
            icon: Icons.local_offer,
          ),
          // Add more NotificationTile instances as needed
        ],
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String title;
  final String message;
  final String timestamp;
  final IconData icon;

  NotificationTile({
    required this.title,
    required this.message,
    required this.timestamp,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4, // Adding elevation for shadow effect
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.blueAccent, size: 30),
            SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center, // Centering the text
                children: [
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16), textAlign: TextAlign.center),
                  SizedBox(height: 4.0),
                  Text(message, textAlign: TextAlign.center),
                  SizedBox(height: 8.0),
                  Text(timestamp, style: TextStyle(color: Colors.grey), textAlign: TextAlign.center),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
