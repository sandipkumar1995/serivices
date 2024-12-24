import 'dart:convert';

import 'package:flutter/material.dart';
import 'model/category.dart';
import 'screens/home_screen.dart';
import 'screens/event_details_screen.dart';
import 'screens/service_details_screen.dart';
import 'utils/data_parser.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  UserActivityMOdel userActivityMOdel = UserActivityMOdel.fromJson(jsonDecode(sampleJson));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) => HomeScreen(userActivityMOdel:userActivityMOdel,),
      },
    );
  }
}

const sampleJson = '''
{
  "categories": [
    {
      "categoryName": "Core Services",
      "services": [
        { "serviceName": "dxo-user-service", "events": ["User Login", "User Registration"] },
        { "serviceName": "dxo-auth-service", "events": ["User Login"] },
        { "serviceName": "dxo-payment-service", "events": ["Order Placement", "Payment Success"] }
      ]
    },
    {
      "categoryName": "Support Services",
      "services": [
        { "serviceName": "dxo-inventory-service", "events": ["Order Placement"] },
        { "serviceName": "dxo-product-service", "events": ["Product Search", "Order Placement"] },
        { "serviceName": "dxo-billing-service", "events": ["Payment Success"] }
      ]
    },
    {
      "categoryName": "Advanced Services",
      "services": [
        { "serviceName": "dxo-recommendation-service", "events": ["Product Search"] },
        { "serviceName": "dxo-report-service", "events": ["Report Generation"] },
        { "serviceName": "dxo-event-service", "events": ["System Alert"] }
      ]
    }
  ]
}
''';



