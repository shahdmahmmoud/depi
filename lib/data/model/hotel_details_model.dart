class HotelDetailsModel {
final String id; // Unique identifier for the hotel
final String name; // Name of the hotel
final String description; // Description of the hotel
final String address; // Address of the hotel
final double rating; // Rating of the hotel
final List<String> images; // List of image URLs

HotelDetailsModel({
  required this.id,
  required this.name,
  required this.description,
  required this.address,
  required this.rating,
  required this.images,
});

/// Factory method to create a HotelDetailsModel from JSON
factory HotelDetailsModel.fromJson(Map<String, dynamic> json) {
return HotelDetailsModel(
id: json['id'] ?? '', // Adjust based on actual JSON structure
name: json['name'] ?? '',
description: json['description'] ?? '',
address: json['address'] ?? '',
rating: (json['rating'] ?? 0.0).toDouble(), // Ensure this is a double
images: List<String>.from(
json['images']?.map((image) => image.toString()) ?? []),
);
}

@override
String toString() {
return 'HotelDetailsModel(id: $id, name: $name, rating: $rating)';
}
}