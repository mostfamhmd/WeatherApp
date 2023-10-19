class WeatherModel {
  final String cityName;
  final DateTime cityDate;
  final double cityTemp;
  final String cityWeatherState;
  final String cityWeatherIcon;
  final String cityCountry;
  WeatherModel({
    required this.cityName,
    required this.cityDate,
    required this.cityTemp,
    required this.cityWeatherState,
    required this.cityWeatherIcon,
    required this.cityCountry,
  });

  factory WeatherModel.fromJson(dynamic data) {
    var location = data["location"];
    var current = data["current"];
    var condition = data["current"]["condition"];
    return WeatherModel(
        cityCountry: location['country'],
        cityName: location["name"],
        cityDate: DateTime.now(),
        cityTemp: current["temp_c"],
        cityWeatherState: condition["text"],
        cityWeatherIcon: condition["icon"]);
  }
}
