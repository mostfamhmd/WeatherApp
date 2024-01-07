class WeatherModel {
  final String cityName;
  final DateTime cityDate;
  final double cityTemp;
  final double cityMaxTemp;
  final double cityMinTemp;
  final String cityWeatherState;
  final String cityWeatherIcon;
  final String cityCountry;
  final List<WeatherModelForcastDays> weatherModelForcastDays;

  WeatherModel({
    required this.cityName,
    required this.cityDate,
    required this.cityTemp,
    required this.cityMaxTemp,
    required this.cityMinTemp,
    required this.cityWeatherState,
    required this.cityWeatherIcon,
    required this.cityCountry,
    required this.weatherModelForcastDays,
  });

  factory WeatherModel.fromJson(dynamic data) {
    var location = data["location"];
    var current = data["current"];
    var condition = data["current"]["condition"];
    var jsonData = data['forecast']['forecastday'][0]['day'];
    var myData = data['forecast']['forecastday'];
    List<WeatherModelForcastDays> weatherDays = [];

    for (int i = 1; i < myData.length; i++) {
      var forecastData = myData[i]["day"];
      weatherDays.add(WeatherModelForcastDays(
        cityDate: myData[i]["date"],
        cityMaxTemp: forecastData["maxtemp_c"],
        cityMinTemp: forecastData["mintemp_c"],
        cityWeatherState: forecastData["condition"]["text"],
        cityWeatherIcon: forecastData["condition"]["icon"],
      ));
    }

    return WeatherModel(
      cityName: location["name"],
      cityCountry: location["country"],
      cityWeatherIcon: condition["icon"],
      cityWeatherState: condition["text"],
      cityDate: DateTime.parse(current['last_updated']),
      cityTemp: current["temp_c"],
      cityMaxTemp: jsonData['maxtemp_c'],
      cityMinTemp: jsonData['mintemp_c'],
      weatherModelForcastDays: weatherDays,
    );
  }
}

class WeatherModelForcastDays {
  final String cityDate;
  final double cityMaxTemp;
  final double cityMinTemp;
  final String cityWeatherState;
  final String cityWeatherIcon;

  WeatherModelForcastDays({
    required this.cityDate,
    required this.cityMaxTemp,
    required this.cityMinTemp,
    required this.cityWeatherState,
    required this.cityWeatherIcon,
  });
}
