import 'package:depi/data/repository/tripadvisor_repository.dart';
import 'package:depi/data/model/location_model.dart';
import 'package:depi/data/model/hotel_model.dart';
import 'package:depi/data/model/hotel_details_model.dart';

class SearchLocationUseCase {
  final TripAdvisorRepository repository;

  SearchLocationUseCase(this.repository);

  /// Use for searching hotels
  Future<List<HotelModel>> callHotels(int pageNumber, String currencyCode) async {
    try {
      return await repository.searchHotels(pageNumber, currencyCode);
    } catch (e) {
      throw Exception('Failed to fetch hotels: $e');
    }
  }

  /// Use for searching hotels by location
  Future<List<HotelModel>> callHotelsByLocation(
      double latitude, double longitude, int pageNumber, String currencyCode) async {
    try {
      return await repository.searchHotelsByLocation(latitude, longitude, pageNumber, currencyCode);
    } catch (e) {
      throw Exception('Failed to fetch hotels by location: $e');
    }
  }

  /// Use for getting hotel details
  Future<HotelDetailsModel> callHotelDetails(String currency) async {
    try {
      return await repository.getHotelDetails(currency);
    } catch (e) {
      throw Exception('Failed to fetch hotel details: $e');
    }
  }

  /// Use for searching locations
  Future<List<LocationModel>> callSearchLocation(String query) async {
    try {
      return await repository.searchLocation(query);
    } catch (e) {
      throw Exception('Failed to fetch locations: $e');
    }
  }
}