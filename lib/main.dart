import 'package:flutter/material.dart';
import 'package:project_for_job/screens/subscription_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SubscriptionPage(),
    );
  }
}
