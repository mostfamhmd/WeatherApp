import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/Components/Home%20Components/search_icon.dart';
import 'package:weather/Components/Joker%20Components/text_component.dart';
import 'package:weather/Model/weather_model.dart';
import 'package:weather/Providers/weather_provider.dart';
import 'package:weather/Screens/search_screen.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  WeatherModel? weatherInfo;
  @override
  Widget build(BuildContext context) {
    weatherInfo = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
        appBar: AppBar(
          title: const TextComponent(
            text: "Weather",
            fonts: "Roboto",
            size: 23,
            color: Colors.white,
          ),
          actions: [
            SearchIcon(
              onpressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              },
            ),
          ],
        ),
        body: weatherInfo == null
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextComponent(
                        text: "there is no weather 😞 start",
                        fonts: "Roboto",
                        color: Colors.black,
                        size: 25),
                    TextComponent(
                        text: "searching now 🔍",
                        fonts: "Roboto",
                        color: Colors.black,
                        size: 25),
                  ],
                ),
              )
            : Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Colors.blue, Colors.blue[300]!, Colors.blue[100]!],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(
                        flex: 3,
                      ),
                      TextComponent(
                          text: weatherInfo!.cityName,
                          fonts: "Roboto",
                          color: Colors.black,
                          size: 30),
                      TextComponent(
                          text:
                              "Updated at : ${weatherInfo!.cityDate.hour.toString()}:${weatherInfo!.cityDate.minute.toString()}",
                          fonts: "Roboto",
                          color: Colors.black,
                          size: 15),
                      TextComponent(
                          text: weatherInfo!.cityCountry,
                          fonts: "Roboto",
                          color: Colors.black,
                          size: 20),
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
                              fonts: "Roboto",
                              color: Colors.black,
                              size: 30),
                        ],
                      ),
                      const Spacer(),
                      TextComponent(
                          text: weatherInfo!.cityWeatherState,
                          fonts: "Roboto",
                          color: Colors.black,
                          size: 30),
                      const Spacer(
                        flex: 3,
                      ),
                    ]),
              ));
  }
}
