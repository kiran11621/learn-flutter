import 'package:flutter/material.dart';
import 'package:flutter_provider/weather_app/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherProvider extends ChangeNotifier {
  bool isLoading = false;

  Weather? todaysWeather;

  Future<void> fetchWeather(String cityName) async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await http.get(
        Uri.parse(
          "https://api.weatherapi.com/v1/current.json?key=e650d175fc1c45b0b91135142240607&q=$cityName&aqi=no",
        ),
      );

      print('im here');
      if (response.statusCode == 200) {
        todaysWeather = weatherFromJson(response.body);
      } else {
        throw Exception('Something went wrong');
      }

      isLoading = false;
      notifyListeners();
    } catch (e, s) {
      isLoading = false;
      notifyListeners();
      print("Error $e $s");
    }
  }
}
