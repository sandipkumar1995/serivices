import 'package:flutter/material.dart';
import '../model/category.dart';
import '../utils/data_parser.dart';
import 'event_details_screen.dart';

class HomeScreen extends StatelessWidget {
  final UserActivityMOdel userActivityMOdel;

  HomeScreen({required this.userActivityMOdel});

  @override
  Widget build(BuildContext context) {
    final events = getUniqueEvents(userActivityMOdel);

    return Scaffold(
      appBar: AppBar(
        title: Text('Events Dashboard'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemCount: events.length,
          itemBuilder: (ctx, index) {
            final eventKey = events.keys.elementAt(index);
            final serviceCount = events[eventKey] ?? 0;
            // with event name we counting the service with assigned to it

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EventDetailsScreen(
                      event: eventKey,
                      userActivityMOdel: userActivityMOdel,
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [Colors.blue.shade50, Colors.blue.shade200],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          eventKey,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Services: $serviceCount',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
