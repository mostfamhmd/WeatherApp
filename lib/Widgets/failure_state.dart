import 'package:flutter/material.dart';
import 'package:weather/Components/Joker%20Components/text_component.dart';

class FailureState extends StatelessWidget {
  const FailureState({
    super.key,
    required this.failed,
  });
  final String failed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextComponent(text: failed, color: Colors.black, fontSize: 25),
    );
  }
}
