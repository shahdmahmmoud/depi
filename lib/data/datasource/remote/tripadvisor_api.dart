import 'dart:convert';
import 'package:http/http.dart' as http;

class TripAdvisorApi {
  final String baseUrl = 'https://tripadvisor16.p.rapidapi.com/api/v1/hotels';
  final String apiKey = '849be836bdmsh8364dedfc48d31bp1801e3jsnbb24fdf9d861';

  // Method to get filtered hotels
  Future<List<dynamic>> getFilteredHotels(Map<String, dynamic> filters) async {
    final response = await http.get(
      Uri.parse('$baseUrl/getHotelsFilter'),
      headers: {
        'X-Rapidapi-Key': apiKey,
        'X-Rapidapi-Host': 'tripadvisor16.p.rapidapi.com',
        'Content-Type': 'application/json',
      },
    );

    print(response.body); // Add this line to inspect the response

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      return responseData['hotels']; // Adjust based on the actual response structure
    } else {
      throw Exception('Failed to load hotels');
    }
  }

  // Method to search hotels
  Future<List<dynamic>> searchHotels(int pageNumber, String currencyCode) async {
    final response = await http.get(
      Uri.parse('$baseUrl/searchHotels?pageNumber=$pageNumber&currencyCode=$currencyCode'),
      headers: {
        'X-Rapidapi-Key': apiKey,
        'X-Rapidapi-Host': 'tripadvisor16.p.rapidapi.com',
        'Content-Type': 'application/json',
      },
    );

    print(response.body); // Add this line to inspect the response

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      return responseData['hotels']; // Adjust based on the actual response structure
    } else {
      throw Exception('Failed to search hotels');
    }
  }

  // Method to search hotels by location
  Future<List<dynamic>> searchHotelsByLocation(double latitude, double longitude, int pageNumber, String currencyCode) async {
    final response = await http.get(
      Uri.parse('$baseUrl/searchHotelsByLocation?latitude=$latitude&longitude=$longitude&pageNumber=$pageNumber&currencyCode=$currencyCode'),
      headers: {
        'X-Rapidapi-Key': apiKey,
        'X-Rapidapi-Host': 'tripadvisor16.p.rapidapi.com',
        'Content-Type': 'application/json',
      },
    );

    print(response.body); // Add this line to inspect the response

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      return responseData['hotels']; // Adjust based on the actual response structure
    } else {
      throw Exception('Failed to search hotels by location');
    }
  }

  // Method to get hotel details
  Future<dynamic> getHotelDetails(String currency) async {
    final response = await http.get(
      Uri.parse('$baseUrl/getHotelDetails?currency=$currency'),
      headers: {
        'X-Rapidapi-Key': apiKey,
        'X-Rapidapi-Host': 'tripadvisor16.p.rapidapi.com',
        'Content-Type': 'application/json',
      },
    );

    print(response.body); // Add this line to inspect the response

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      return responseData['hotel']; // Adjust based on the actual response structure
    } else {
      throw Exception('Failed to get hotel details');
    }
  }

  // Method to search locations
  Future<List<dynamic>> searchLocation(String query) async {
    final response = await http.get(
      Uri.parse('$baseUrl/searchLocation?query=$query'),
      headers: {
        'X-Rapidapi-Key': apiKey,
        'X-Rapidapi-Host': 'tripadvisor16.p.rapidapi.com',
        'Content-Type': 'application/json',
      },
    );

    print(response.body); // Add this line to inspect the response

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      return responseData['locations']; // Adjust based on the actual response structure
    } else {
      throw Exception('Failed to search locations');
    }
  }
}
