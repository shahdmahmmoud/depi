// lib/data/model/location_model.dart

class LocationModel {
  final String name; // Name of the location
  final double latitude; // Latitude of the location
  final double longitude; // Longitude of the location

  LocationModel({
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  /// Factory method to create a LocationModel from JSON
  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      name: json['name'] ?? '',
      latitude: json['latitude'] ?? 0.0,
      longitude: json['longitude'] ?? 0.0,
    );
  }
}
