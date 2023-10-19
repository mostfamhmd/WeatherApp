import 'package:flutter/material.dart';
import 'package:weather/Components/Joker%20Components/text_component.dart';

class InitialState extends StatelessWidget {
  const InitialState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextComponent(
              text: "there is no weather 😞 start",
              color: Colors.black,
              fontSize: 25),
          TextComponent(
              text: "searching now 🔍", color: Colors.black, fontSize: 25),
        ],
      ),
    );
  }
}
