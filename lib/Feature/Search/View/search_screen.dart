import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/Feature/Search/View/widgets/search_field_component.dart';
import 'package:weather/core/widgets/text_component.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300]!,
      appBar: AppBar(
        backgroundColor: Colors.blue[300]!,
        elevation: 0,
        title: TextComponent(
          text: "Search a City",
          size: 23.sp,
          color: Colors.white,
        ),
      ),
      body: Align(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: const SearchField(),
      )),
    );
  }
}
