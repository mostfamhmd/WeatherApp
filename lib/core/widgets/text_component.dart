// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextComponent extends StatelessWidget {
  const TextComponent(
      {Key? key, required this.text, required this.color, required this.size})
      : super(key: key);

  final String text;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Roboto",
        color: color,
        fontSize: size,
      ),
    );
  }
}
