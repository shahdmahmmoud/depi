abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final List<dynamic> locations; // List of your location or hotel models

  LocationLoaded(this.locations); // Constructor to initialize locations
}

class SearchLocationLoaded extends LocationState {
  final List<dynamic> locations; // Adjust the type based on your data model

  SearchLocationLoaded(this.locations);
}

class LocationError extends LocationState {
  final String message;

  LocationError(this.message);
}

class HotelDetailsLoaded extends LocationState {
  final dynamic hotelDetails; // Adjust the type based on your data model

  HotelDetailsLoaded(this.hotelDetails);
}
