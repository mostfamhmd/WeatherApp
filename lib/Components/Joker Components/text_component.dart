// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextComponent extends StatelessWidget {
  TextComponent(
      {Key? key,
      required this.text,
      required this.color,
      required this.fontSize})
      : super(key: key);

  final String text;
  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Roboto",
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}
