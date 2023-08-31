import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/Model/weather_model.dart';

class WeatherServices {
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;
    try {
      // ignore: non_constant_identifier_names
      String BaseUrl = "http://api.weatherapi.com/v1";
      // ignore: non_constant_identifier_names
      String ApiKey = "45baa7cae04d4adf91a121808231808";
      Uri url =
          Uri.parse("$BaseUrl/current.json?key=$ApiKey&q=$cityName&aqi=yes");
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      var location = data["location"];
      var current = data["current"];
      var condition = data["current"]["condition"];
      weather = WeatherModel(
          cityCountry: location['country'],
          cityName: location["name"],
          cityDate: DateTime.parse(location["localtime"]),
          cityTemp: current["temp_c"],
          cityWeatherState: condition["text"],
          cityWeatherIcon: condition["icon"]);
    } catch (e) {
      print(e);
    }
    return weather;
  }
}
