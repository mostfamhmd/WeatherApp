import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/Feature/Home/Presentation/Model/weather_model.dart';
import 'package:weather/core/widgets/text_component.dart';

class ForCastDays extends StatelessWidget {
  const ForCastDays({super.key, required this.weatherModelForcastDays});
  final WeatherModelForcastDays weatherModelForcastDays;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20.w),
      height: 100.h,
      width: 130.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r), color: Colors.blue[300]!),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10.h,
          ),
          TextComponent(
              text: weatherModelForcastDays.cityDate,
              color: Colors.black,
              size: 20.sp),
          SizedBox(
            height: 20.h,
          ),
          Image(
            image: NetworkImage(
              "http:${weatherModelForcastDays.cityWeatherIcon}",
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextComponent(text: "MaxTemp", color: Colors.black, size: 15.sp),
              TextComponent(
                  text: "${weatherModelForcastDays.cityMaxTemp}",
                  color: Colors.black,
                  size: 15.sp),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextComponent(text: "MinTemp", color: Colors.black, size: 15.sp),
              TextComponent(
                  text: "${weatherModelForcastDays.cityMinTemp}",
                  color: Colors.black,
                  size: 15.sp),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          TextComponent(
              text: weatherModelForcastDays.cityWeatherState,
              color: Colors.black,
              size: 18.sp),
        ],
      ),
    );
  }
}
