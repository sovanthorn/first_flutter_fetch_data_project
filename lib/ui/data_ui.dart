import 'package:first_fetch_api_project/ui/detail_ui.dart';
import 'package:flutter/material.dart';
import '../service/api_service.dart'; // Adjust the path if needed
import '../model/data.dart'; // Adjust the path if needed

class DataScreen extends StatefulWidget {
  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  late Future<List<Data>> futureData;
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    futureData = apiService.fetchData(); // Fetch a list of Data objects
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data List"),
      ),
      body: FutureBuilder<List<Data>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Loading state
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}")); // Error state
          } else if (snapshot.hasData) {
            final dataList = snapshot.data!;
            return ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                final data = dataList[index];
                return ListTile(
                  title: Text(data.title),
                  subtitle: Text(data.body),
                  onTap: () {
                    // Navigate to DetailScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(data: data),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return Center(child: Text("No data found")); // No data state
          }
        },
      ),
    );
  }
}
