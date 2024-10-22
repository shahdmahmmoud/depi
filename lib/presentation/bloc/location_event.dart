// location_event.dart

abstract class LocationEvent {}

class FetchHotels extends LocationEvent {
  final int pageNumber;
  final String currencyCode;

  FetchHotels(this.pageNumber, this.currencyCode);
}

class FetchHotelsByLocation extends LocationEvent {
  final double latitude;
  final double longitude;
  final int pageNumber;
  final String currencyCode;

  FetchHotelsByLocation(
      this.latitude, this.longitude, this.pageNumber, this.currencyCode);
}

class FetchHotelDetails extends LocationEvent {
  final String currency;

  FetchHotelDetails(this.currency);
}

class FetchSearchLocation extends LocationEvent {
  final String query;

  FetchSearchLocation(this.query);
}
