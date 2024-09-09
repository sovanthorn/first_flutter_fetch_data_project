import 'package:flutter/material.dart';
import '../model/data.dart'; // Adjust the path if needed

class DetailScreen extends StatelessWidget {
  final Data data;

  DetailScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Data ID: ${data.id}, User ID: ${data.userId}",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 16),
            Text(data.body, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
