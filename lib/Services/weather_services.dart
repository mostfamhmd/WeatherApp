import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/Model/weather_model.dart';

class WeatherServices {
  Future<WeatherModel?> getWeather({required String cityName}) async {
    String baseUrl = "http://api.weatherapi.com/v1";
    String apiKey = "526891f9562a4016be1165504231810";
    Uri url =
        Uri.parse("$baseUrl/current.json?key=$apiKey&q=$cityName&aqi=yes");
    http.Response response = await http.get(url);
    if (response.statusCode == 400) {
      var data = jsonDecode(response.body);
      throw Exception(data['error']['message']);
    }
    Map<String, dynamic> data = jsonDecode(response.body);
    WeatherModel weather = WeatherModel.fromJson(data);
    return weather;
  }
}
