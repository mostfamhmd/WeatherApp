import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/widgets/text_component.dart';

class NotFoundCity extends StatelessWidget {
  const NotFoundCity({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextComponent(
              text: "there is no weather 😞 start",
              fonts: "Roboto",
              color: Colors.black,
              size: 25.sp),
          TextComponent(
              text: "searching now 🔍",
              fonts: "Roboto",
              color: Colors.black,
              size: 25.sp),
        ],
      ),
    );
  }
}
