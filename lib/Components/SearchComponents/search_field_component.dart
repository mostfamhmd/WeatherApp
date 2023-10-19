import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather_state/weather_cubit.dart';

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
      onSubmitted: (data) {
        cityName = data;

        BlocProvider.of<WeatherCubit>(context)
            .getWeather(cityName: cityName ?? "ismailia");
        Navigator.pop(context);
      },
      decoration: InputDecoration(
          hintText: "Enter City Name",
          labelText: "Search",
          contentPadding:
              const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          suffixIcon: GestureDetector(
              onTap: () {
                BlocProvider.of<WeatherCubit>(context)
                    .getWeather(cityName: cityName ?? "ismailia");
                Navigator.pop(context);
              },
              child: const Icon(Icons.search)),
          border: const OutlineInputBorder(
            borderSide: BorderSide(),
          )),
    );
  }
}
