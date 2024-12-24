import 'package:flutter/material.dart';

import '../model/category.dart';
import '../utils/data_parser.dart';

class ServiceDetailsScreen extends StatelessWidget {
  final UserActivityMOdel userActivityMOdel;
  final String eventName;
  final String service;

  ServiceDetailsScreen({
    required this.userActivityMOdel,
    required this.eventName,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    final events = getEventsForService(service, userActivityMOdel);

    return Scaffold(
      appBar: AppBar(
        title: Text('Service Details'),
        backgroundColor: Colors.blueAccent,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Service Name and Icon
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(Icons.star_border, size: 40, color: Colors.blueAccent),
                      SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          'Service: $service',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Placeholder Description
              Text(
                'Description:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 8),
              Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'This is a placeholder description for the service.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Events Section
              Text(
                'Events Associated with $service:',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 10),

              events.isNotEmpty
                  ? Container(
                height: 60, // Height of the chip container
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: events.map((event) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Chip(
                        label: Text(
                          event,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Colors.blueAccent,
                        elevation: 4,
                      ),
                    );
                  }).toList(),
                ),
              )
                  : Center(
                child: Text(
                  'No events found for this service.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),

              SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}
