import 'package:flutter/material.dart';
import 'package:weather/Model/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  // ignore: non_constant_identifier_names
  WeatherModel? _WeatherData;

  set weatherData(WeatherModel? weatherInfo) {
    _WeatherData = weatherInfo;
    notifyListeners();
  }

  WeatherModel? get weatherData => _WeatherData;
}
