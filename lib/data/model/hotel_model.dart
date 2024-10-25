class HotelModel {
  final String id; // Unique identifier for the hotel
  final String name; // Name of the hotel
  final String address; // Address of the hotel
  final double rating; // Rating of the hotel (changed to double)

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
      rating: (json['rating'] ?? 0.0).toDouble(), // Ensure this is a double
    );
  }

  @override
  String toString() {
    return 'HotelModel(id: $id, name: $name, rating: $rating)';
  }
}

