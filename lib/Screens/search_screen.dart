import 'package:flutter/material.dart';
import 'package:weather/Components/SearchComponents/search_field_component.dart';
import 'package:weather/Components/Joker%20Components/text_component.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  String? cityName;

  SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextComponent(
          text: "Search a City",
          fontSize: 23,
          color: Colors.white,
        ),
      ),
      body: Align(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SearchField(cityName),
      )),
    );
  }
}
