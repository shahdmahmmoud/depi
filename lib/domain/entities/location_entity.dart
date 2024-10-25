class LocationEntity {
  final String id;
  final String name;
  final String description;
  final String address;
  final String imageUrl;

  LocationEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.imageUrl,
  });

  // Example of a factory method to create a LocationEntity from a map
  factory LocationEntity.fromMap(Map<String, dynamic> map) {
    return LocationEntity(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      address: map['address'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  // Example of a method to convert a LocationEntity to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'address': address,
      'imageUrl': imageUrl,
    };
  }
}
