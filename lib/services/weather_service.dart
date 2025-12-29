import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather.dart';
import '../models/forecast.dart';

class WeatherService {
  static const String _apiKey = 'f94600e7d3c69dbe28aee692e1b292c1';
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5';

  // ================= CURRENT WEATHER BY CITY =================
  Future<Weather> getCurrentWeatherByCity(String cityName) async {
    try {
      if (cityName.trim().isEmpty) {
        throw Exception('City name is empty');
      }

      final url = Uri.parse(
        '$_baseUrl/weather?q=$cityName&appid=$_apiKey&units=metric',
      );

      final response = await http.get(url);
      final data = json.decode(response.body);

      if (response.statusCode == 200) {
        return Weather.fromJson(data);
      } else {
        throw Exception(data['message'] ?? 'Weather error');
      }
    } catch (e) {
      rethrow; // ✅ VERY IMPORTANT
    }
  }

  // ================= CURRENT WEATHER BY LOCATION =================
  Future<Weather> getCurrentWeatherByLocation(
      double latitude,
      double longitude,
      ) async {
    try {
      final url = Uri.parse(
        '$_baseUrl/weather?lat=$latitude&lon=$longitude&appid=$_apiKey&units=metric',
      );

      final response = await http.get(url);
      final data = json.decode(response.body);

      if (response.statusCode == 200) {
        return Weather.fromJson(data);
      } else {
        throw Exception(data['message'] ?? 'Weather error');
      }
    } catch (e) {
      rethrow;
    }
  }

  // ================= FORECAST BY CITY =================
  Future<Forecast> getForecastByCity(String cityName) async {
    try {
      if (cityName.trim().isEmpty) {
        throw Exception('City name is empty');
      }

      final url = Uri.parse(
        '$_baseUrl/forecast?q=$cityName&appid=$_apiKey&units=metric',
      );

      final response = await http.get(url);
      final data = json.decode(response.body);

      if (response.statusCode == 200) {
        return Forecast.fromJson(data);
      } else {
        throw Exception(data['message'] ?? 'Forecast error');
      }
    } catch (e) {
      rethrow;
    }
  }

  // ================= FORECAST BY LOCATION =================
  Future<Forecast> getForecastByLocation(
      double latitude,
      double longitude,
      ) async {
    try {
      final url = Uri.parse(
        '$_baseUrl/forecast?lat=$latitude&lon=$longitude&appid=$_apiKey&units=metric',
      );

      final response = await http.get(url);
      final data = json.decode(response.body);

      if (response.statusCode == 200) {
        return Forecast.fromJson(data);
      } else {
        throw Exception(data['message'] ?? 'Forecast error');
      }
    } catch (e) {
      rethrow;
    }
  }
}
