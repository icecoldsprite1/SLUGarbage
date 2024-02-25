import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slugarbage/item_info_template.dart';
import 'package:slugarbage/items.dart';
import 'package:slugarbage/main.dart';

class AllItemsPage extends StatelessWidget {
  const AllItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Scaffold(
      appBar: AppBar(title: const Text("All Items")),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: itemsList.entries.map((entry) {
            String key = entry.key;
            dynamic value = entry.value;
            return ListTile(
                title: RichText(
                    text: TextSpan(children: [
              TextSpan(children: [
                WidgetSpan(
                  child: TextButton(
                      onPressed: () {
                        appState.onButtonPressed(key);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const ItemInfo())));
                      },
                      child: Text('$key: ',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange))),
                )
              ]),
              TextSpan(
                  text:
                      '\nType: ${value.type} \nDescription: ${value.description}')
            ])));
          }).toList()),
    );
  }
}
