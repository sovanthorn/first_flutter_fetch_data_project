import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/data.dart';

class ApiService {
  Future<List<Data>> fetchData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => Data.fromJson(json)).toList(); // Convert list of JSON to list of Data objects
    } else {
      throw Exception('Failed to load data');
    }
  }
}
