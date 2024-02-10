import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slugarbage/main.dart';

class TextInputWidget extends StatelessWidget {
  TextInputWidget({super.key});
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var name = appState.current;

    IconData nameIcon;
    String toggle = '';
    if (appState.names.contains(name)) {
      nameIcon = Icons.person_remove;
      toggle = 'Remove';
    } else {
      nameIcon = Icons.person_add;
      toggle = 'Add';
    }

    return Column(children: [
      Container(
        padding: const EdgeInsets.all(100.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person),
              labelText: "Enter a Name",
              suffixIcon: IconButton(
                icon: const Icon(Icons.send),
                tooltip: "Submit",
                onPressed: () {
                  appState.text(controller.text);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const MyHomePage())));
                },
              )),
        ),
      ),
      ElevatedButton.icon(
        onPressed: () {
          appState.toggleNames();
        },
        icon: Icon(nameIcon),
        label: Text(toggle),
      ),
      Text(appState.current),
    ]);
  }
}
