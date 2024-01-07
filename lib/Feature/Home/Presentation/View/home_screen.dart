// home_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/Feature/Home/data/WeatherCubit/weather_cubit.dart';
import 'package:weather/Feature/Search/View/search_screen.dart';
import 'widgets/forcast_days_list_view.dart';
import 'widgets/my_city_temp.dart';
import 'widgets/not_found_city.dart';
import 'widgets/search_icon.dart';
import 'package:weather/core/widgets/text_component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300]!,
        elevation: 0,
        title: TextComponent(
          text: "Weather",
          size: 23.sp,
          color: Colors.white,
        ),
        actions: [
          SearchIcon(
            onpressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherCubitLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blue[300]!,
              ),
            );
          } else if (state is WeatherSuccess) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MyCityTemp(
                  weatherModel: state.weatherModel,
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 250.h,
                  child: ForCastDaysListView(
                    weatherModelForcastDays:
                        state.weatherModel.weatherModelForcastDays,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                )
              ],
            );
          } else if (state is WeatherFailed) {
            return Center(
              child: TextComponent(
                text: state.errMessage,
                color: Colors.black,
                size: 30.sp,
              ),
            );
          } else {
            return const NotFoundCity();
          }
        },
      ),
    );
  }
}
