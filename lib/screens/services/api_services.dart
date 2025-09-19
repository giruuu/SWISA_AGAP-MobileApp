import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  static const String baseUrl = "http://10.0.2.2:8000/api"; // Android emulator
  final storage = const FlutterSecureStorage();

  // Fetch all grants
  Future<List<dynamic>> getGrants() async {
    final url = Uri.parse('$baseUrl/grants');
    final res = await http.get(url);

    if (res.statusCode == 200) {
      return json.decode(res.body);
    } else {
      throw Exception('Failed to load grants');
    }
  }

  // Apply for a grant
  Future<bool> applyGrant(int grantId, Map<String, dynamic> formData) async {
    final token = await storage.read(key: 'token');
    final url = Uri.parse('$baseUrl/applications');
    final res = await http.post(url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: {
          'grant_id': grantId.toString(),
          'form_data': json.encode(formData),
        });

    return res.statusCode == 201;
  }
}
