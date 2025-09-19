// This file defines the structure of the Grant data.
class GrantType {
  final int id;
  final String grantType;

  GrantType({required this.id, required this.grantType});

  factory GrantType.fromJson(Map<String, dynamic> json) {
    return GrantType(
      id: json['id'] ?? 0,
      grantType: json['grant_type'] ?? 'No Type',
    );
  }
}

class Grant {
  final int id;
  final String title;
  final String? description;
  final int totalQuantity;
  final String? availableAt; // Dates come as strings from the API
  final GrantType grantType;

  Grant({
    required this.id,
    required this.title,
    this.description,
    required this.totalQuantity,
    this.availableAt,
    required this.grantType,
  });

  factory Grant.fromJson(Map<String, dynamic> json) {
    return Grant(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'No Title',
      description: json['description'],
      totalQuantity: json['total_quantity'] ?? 0,
      availableAt: json['available_at'],
      grantType: GrantType.fromJson(json['grant_type'] ?? {}),
    );
  }
}