import 'package:flutter/material.dart';

class Trip {
  final String name;
  final String date;
  final String description;
  final bool isUpcoming; // New field to categorize trips

  Trip(this.name, this.date, this.description, this.isUpcoming);
}

class MyTripsScreen extends StatelessWidget {
  final List<Trip> trips = [
    Trip(
      'Beach Vacation',
      'June 20, 2023',
      'A relaxing week by the sea with beautiful sunsets and beach activities.',
      false, // Already taken
    ),
    Trip(
      'Mountain Hiking',
      'July 15, 2023',
      'An adventurous climbing experience with breathtaking views and fresh air.',
      true, // Upcoming trip
    ),
    Trip(
      'City Tour',
      'August 10, 2023',
      'Exploring the historic sites and vibrant culture of the city.',
      true, // Upcoming trip
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final takenTrips = trips.where((trip) => !trip.isUpcoming).toList();
    final upcomingTrips = trips.where((trip) => trip.isUpcoming).toList();

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            indicatorColor: Colors.blueAccent, // Indicator color for selected tab
            labelColor: Colors.blueAccent, // Text color for selected tab
            unselectedLabelColor: Colors.black, // Text color for unselected tabs
            tabs: [
              Tab(text: "Trips I've Taken"),
              Tab(text: 'Upcoming Trips'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildTripList(context, takenTrips),
                _buildTripList(context, upcomingTrips),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTripList(BuildContext context, List<Trip> trips) {
    return ListView.builder(
      itemCount: trips.length,
      itemBuilder: (context, index) {
        final trip = trips[index];
        return Card(
          margin: EdgeInsets.all(10),
          child: ListTile(
            title: Text(trip.name, style: TextStyle(fontSize: 20)),
            subtitle: Text(
              '${trip.date}\n${trip.description.substring(0, 30)}...',
              style: TextStyle(fontSize: 16),
            ),
            isThreeLine: true,
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TripDetailScreen(trip: trip),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class TripDetailScreen extends StatelessWidget {
  final Trip trip;

  TripDetailScreen({required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(trip.name),
        backgroundColor: Color(0xFF448AFF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              trip.description,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Details to be continued...',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
