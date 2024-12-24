import 'package:flutter/material.dart';
import 'package:technicalassignment/screens/service_details_screen.dart';
import '../model/category.dart';
import '../utils/data_parser.dart';

class EventDetailsScreen extends StatelessWidget {
  final String event;
  final UserActivityMOdel userActivityMOdel;

  EventDetailsScreen({required this.event, required this.userActivityMOdel});

  @override
  Widget build(BuildContext context) {
    final groupedServices = getServicesByEventCategory(event, userActivityMOdel);

    return Scaffold(
      appBar: AppBar(
        title: Text('Event Details: $event'),
        backgroundColor: Colors.blueAccent,
      ),
      body: groupedServices.isNotEmpty
          ? Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: groupedServices.length,
          itemBuilder: (ctx, index) {
            final categoryName = groupedServices.keys.elementAt(index);
            final services = groupedServices[categoryName]!;

            return Card(
              elevation: 3,
              margin: EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ExpansionTile(
                title: Text(
                  categoryName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                children: services.map((service) {
                  return ListTile(
                    leading: Icon(Icons.star_border, color: Colors.blueAccent),
                    title: Text(
                      service,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ServiceDetailsScreen(
                            userActivityMOdel: userActivityMOdel,
                            eventName: event,
                            service: service,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            );
          },
        ),
      )
          : Center(
        child: Text(
          'No services found for this event.',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ),
    );
  }
}
