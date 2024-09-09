import 'package:flutter/material.dart';
import 'ui/data_ui.dart'; // Adjust the path if needed

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DataScreen(), // Set DataScreen as the home screen
    );
  }
}
