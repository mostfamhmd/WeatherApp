import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Components/Home%20Components/search_icon.dart';
import 'package:weather/Components/Joker%20Components/text_component.dart';
import 'package:weather/Model/weather_model.dart';
import 'package:weather/Screens/search_screen.dart';
import 'package:weather/Widgets/failure_state.dart';
import 'package:weather/Widgets/initial_state.dart';
import 'package:weather/Widgets/success_state.dart';
import 'package:weather/weather_state/weather_cubit.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  WeatherModel? weatherInfo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextComponent(
            text: "Weather",
            fontSize: 23,
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
        body:
            BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherSuccess) {
            weatherInfo = BlocProvider.of<WeatherCubit>(context).weatherModel;
            return SuccessState(weatherInfo: weatherInfo);
          } else if (state is WeatherFailure) {
            return FailureState(
              failed: state.failed,
            );
          } else {
            return const InitialState();
          }
        }));
  }
}
