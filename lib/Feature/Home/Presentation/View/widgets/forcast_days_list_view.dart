import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/Feature/Home/Presentation/View/widgets/forcast_days.dart';
import 'package:weather/Feature/Home/Presentation/Model/weather_model.dart';

class ForCastDaysListView extends StatelessWidget {
  const ForCastDaysListView({super.key, required this.weatherModelForcastDays});
  final List<WeatherModelForcastDays> weatherModelForcastDays;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(left: 20.w),
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: weatherModelForcastDays.length,
      itemBuilder: (context, index) {
        return ForCastDays(
          weatherModelForcastDays: weatherModelForcastDays[index],
        );
      },
    );
  }
}
