import 'package:flutter/material.dart';

class Items extends StatelessWidget {
  Items({super.key});
  final Map<String, String> items = {
    "battery": "other",
    "banana": "compost",
    "plastic water bottle": "recycle"
  };

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
