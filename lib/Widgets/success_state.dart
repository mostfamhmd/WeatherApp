import 'package:flutter/material.dart';
import 'package:weather/Components/Joker%20Components/text_component.dart';
import 'package:weather/Model/weather_model.dart';

class SuccessState extends StatelessWidget {
  const SuccessState({
    super.key,
    required this.weatherInfo,
  });

  final WeatherModel? weatherInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.blue, Colors.blue[300]!, Colors.blue[100]!],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Spacer(
          flex: 3,
        ),
        TextComponent(
            text: weatherInfo!.cityName, color: Colors.black, fontSize: 30),
        TextComponent(
            text:
                "Updated at : ${weatherInfo!.cityDate.hour.toString()} : ${weatherInfo!.cityDate.minute.toString()}",
            color: Colors.black,
            fontSize: 15),
        TextComponent(
            text: weatherInfo!.cityCountry, color: Colors.black, fontSize: 20),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: NetworkImage(
                "http:${weatherInfo!.cityWeatherIcon}",
              ),
            ),
            TextComponent(
                text: "${weatherInfo!.cityTemp}",
                color: Colors.black,
                fontSize: 30),
          ],
        ),
        const Spacer(),
        TextComponent(
            text: weatherInfo!.cityWeatherState,
            color: Colors.black,
            fontSize: 30),
        const Spacer(
          flex: 3,
        ),
      ]),
    );
  }
}
