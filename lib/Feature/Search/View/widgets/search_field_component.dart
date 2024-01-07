// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/Feature/Home/data/WeatherCubit/weather_cubit.dart';

// ignore: must_be_immutable
class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String? cityName;
    return TextField(
      onChanged: (data) {
        cityName = data;
      },
      decoration: InputDecoration(
          hintText: "Enter City Name",
          labelText: "Search",
          contentPadding:
              EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
          suffixIcon: GestureDetector(
              onTap: () async {
                if (cityName!.isNotEmpty) {
                  BlocProvider.of<WeatherCubit>(context)
                      .getWeatherInfo(cityName: cityName!);
                  Navigator.pop(context);
                }
              },
              child: const Icon(Icons.search)),
          border: const OutlineInputBorder(
            borderSide: BorderSide(),
          )),
    );
  }
}
