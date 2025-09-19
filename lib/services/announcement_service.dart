import 'dart:convert';
import 'package:http/http.dart' as http;

class Announcement {
  final int id;
  final int roleId;
  final String title;
  final String message;
  final String? image;
  final String postedAt;

  Announcement({
    required this.id,
    required this.roleId,
    required this.title,
    required this.message,
    this.image,
    required this.postedAt,
  });

  factory Announcement.fromJson(Map<String, dynamic> json) {
    return Announcement(
      id: json['id'],
      roleId: json['role_id'],
      title: json['title'],
      message: json['message'],
      image: json['image'],
      postedAt: json['posted_at'],
    );
  }
}

class AnnouncementService {
  final String baseUrl = "http://10.0.2.2:8000/api"; // use 10.0.2.2 for Android emulator

  Future<List<Announcement>> fetchAnnouncements() async {
    final response = await http.get(
      Uri.parse("$baseUrl/announcements"),
      headers: {"Accept": "application/json"},
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((json) => Announcement.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load announcements");
    }
  }
}