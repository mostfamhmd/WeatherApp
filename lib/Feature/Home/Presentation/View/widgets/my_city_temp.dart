import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/Feature/Home/Presentation/Model/weather_model.dart';
import 'package:weather/core/widgets/text_component.dart';

class MyCityTemp extends StatelessWidget {
  const MyCityTemp({super.key, required this.weatherModel});
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      height: 450.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(50.r)),
        color: Colors.blue[300]!,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Spacer(),
        Center(
          child: TextComponent(
              text: weatherModel.cityName, color: Colors.black, size: 30.sp),
        ),
        Center(
          child: TextComponent(
              text:
                  "Updated at : ${weatherModel.cityDate.hour.toString()}:${weatherModel.cityDate.minute.toString()}",
              color: Colors.black,
              size: 15.sp),
        ),
        Center(
          child: TextComponent(
              text: weatherModel.cityCountry, color: Colors.black, size: 20.sp),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: NetworkImage(
                "http:${weatherModel.cityWeatherIcon}",
              ),
            ),
            TextComponent(
                text: "${weatherModel.cityTemp}",
                color: Colors.black,
                size: 30.sp),
          ],
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                TextComponent(
                    text: "Max Temp", color: Colors.black, size: 18.sp),
                TextComponent(
                    text: "${weatherModel.cityMaxTemp}",
                    color: Colors.black,
                    size: 15.sp)
              ],
            ),
            Column(
              children: [
                TextComponent(
                    text: "Min Temp", color: Colors.black, size: 18.sp),
                TextComponent(
                    text: "${weatherModel.cityMinTemp}",
                    color: Colors.black,
                    size: 15.sp)
              ],
            ),
          ],
        ),
        const Spacer(),
        Center(
          child: TextComponent(
              text: weatherModel.cityWeatherState,
              color: Colors.black,
              size: 30.sp),
        ),
        const Spacer(),
      ]),
    );
  }
}
