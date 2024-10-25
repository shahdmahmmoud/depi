import 'package:depi/data/datasource/remote/tripadvisor_api.dart';
import 'package:depi/data/model/location_model.dart';
import 'package:depi/data/model/hotel_model.dart';
import 'package:depi/data/model/hotel_details_model.dart';
class TripAdvisorRepository {
  final TripAdvisorApi api;

  TripAdvisorRepository(this.api);

  /// Fetch filtered hotels based on provided filters.
  Future<List<HotelModel>> fetchHotels(Map<String, dynamic> filters) async {
    try {
      final response = await api.getFilteredHotels(filters);
      // Convert response to List<HotelModel>
      return response
          .map<HotelModel>((hotel) => HotelModel.fromJson(hotel))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch filtered hotels: $e');
    }
  }

  /// Search for hotels with pagination and currency.
  Future<List<HotelModel>> searchHotels(
      int pageNumber, String currencyCode) async {
    try {
      final response = await api.searchHotels(pageNumber, currencyCode);
      // Convert response to List<HotelModel>
      return response
          .map<HotelModel>((hotel) => HotelModel.fromJson(hotel))
          .toList();
    } catch (e) {
      throw Exception('Failed to search hotels: $e');
    }
  }

  /// Search hotels by geographical location.
  Future<List<HotelModel>> searchHotelsByLocation(double latitude,
      double longitude, int pageNumber, String currencyCode) async {
    try {
      final response = await api.searchHotelsByLocation(
          latitude, longitude, pageNumber, currencyCode);
      // Convert response to List<HotelModel>
      return response
          .map<HotelModel>((hotel) => HotelModel.fromJson(hotel))
          .toList();
    } catch (e) {
      throw Exception('Failed to search hotels by location: $e');
    }
  }

  /// Get detailed information about a hotel.
  Future<HotelDetailsModel> getHotelDetails(String currency) async {
    try {
      final response = await api.getHotelDetails(currency);
      // Convert response to HotelDetailsModel
      return HotelDetailsModel.fromJson(response);
    } catch (e) {
      throw Exception('Failed to fetch hotel details: $e');
    }
  }

  /// Search for locations based on a query.
  Future<List<LocationModel>> searchLocation(String query) async {
    try {
      final response = await api.searchLocation(query);
      // Convert response to List<LocationModel>
      return response
          .map<LocationModel>((location) => LocationModel.fromJson(location))
          .toList();
    } catch (e) {
      throw Exception('Failed to search locations: $e');
    }
  }
}
