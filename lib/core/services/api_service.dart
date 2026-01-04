import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/grocery.dart';

class ApiService {
  static const String baseUrl = 'https://dummyjson.com/c/a9ae-fe10-4206-819c';

  Future<Grocery> fetchGrocery() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return Grocery.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load grocery data');
    }
  }
}
