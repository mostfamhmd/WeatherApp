import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/Model/weather_model.dart';
import 'package:weather/Providers/weather_provider.dart';
import 'package:weather/Services/weather_services.dart';

// ignore: must_be_immutable
class SearchField extends StatelessWidget {
  SearchField(
    String? cityName, {
    super.key,
  });
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (data) {
        cityName = data;
      },
      onSubmitted: (data) async {
        cityName = data;
        WeatherServices services = WeatherServices();
        WeatherModel? weather = await services.getWeather(cityName: cityName!);
        // ignore: use_build_context_synchronously
        Provider.of<WeatherProvider>(context, listen: false).weatherData =
            weather;
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      },
      decoration: InputDecoration(
          hintText: "Enter City Name",
          labelText: "Search",
          contentPadding:
              const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          suffixIcon: GestureDetector(
              onTap: () async {
                WeatherServices services = WeatherServices();
                WeatherModel? weather =
                    await services.getWeather(cityName: cityName!);
                // ignore: use_build_context_synchronously
                Provider.of<WeatherProvider>(context, listen: false)
                    .weatherData = weather;
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
              },
              child: const Icon(Icons.search)),
          border: const OutlineInputBorder(
            borderSide: BorderSide(),
          )),
    );
  }
}
