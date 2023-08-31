import 'package:flutter/material.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({super.key, required this.onpressed});
  final VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onpressed,
        icon: const Icon(
          Icons.search,
          color: Colors.white,
          size: 35,
        ));
  }
}
