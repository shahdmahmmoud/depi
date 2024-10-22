// lib/data/model/hotel_model.dart

class HotelModel {
  final String id; // Unique identifier for the hotel
  final String name; // Name of the hotel
  final String address; // Address of the hotel
  final String rating; // Rating of the hotel

  HotelModel({
    required this.id,
    required this.name,
    required this.address,
    required this.rating,
  });

  /// Factory method to create a HotelModel from JSON
  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      id: json['id'] ?? '', // Adjust based on actual JSON structure
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      rating:
          json['rating']?.toString() ?? 'N/A', // Convert to string if necessary
    );
  }
}
