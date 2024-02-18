import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slugarbage/text_input_widget.dart';
import 'package:slugarbage/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    double screenWidth = MediaQuery.of(context).size.width;
    double margin = screenWidth * 0.1;

    return Column(children: [
      const SizedBox(height: 20),
      Center(
        child: Text(
          'Hello, ${appState.current}',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey[900],
          ),
        ),
      ),
      const SizedBox(height: 20),
      Container(
        margin: EdgeInsets.symmetric(horizontal: margin),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: const Text(
            'Welcome to SLUGarbage. This is a place to learn about how to properly dispose of items. Start by tapping on the search icon. The map locates places where the proper disposal bin is located.'),
      ),
      const SizedBox(height: 20),
      Container(
          margin: EdgeInsets.symmetric(horizontal: margin),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Text('Points: ${appState.points}')),
    ]);
  }
}
