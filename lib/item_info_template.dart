import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slugarbage/items.dart';
import 'package:slugarbage/main.dart';
import 'package:slugarbage/widgets.dart';

class ItemInfo extends StatelessWidget {
  const ItemInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var item = itemsList[appState.pageItemName];
    var myHeight = MediaQuery.of(context).size.height * 0.4;
    var myWidth = MediaQuery.of(context).size.width * 0.7;
    double screenWidth = MediaQuery.of(context).size.width;
    double margin = screenWidth * 0.1;

    return Scaffold(
      appBar: AppBar(title: Text(appState.pageItemName)),
      body: ListView(children: [
        Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(height: 10),
            Header('${item.type}'),
            SizedBox(
              child: item.image,
              height: myHeight,
              width: myWidth,
            ),
            const SizedBox(height: 10),
          ]),
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: margin),
            padding: const EdgeInsets.all(20),
            child: Paragraph('Summary:\n${item.description}')),
        Container(
            margin: EdgeInsets.symmetric(horizontal: margin),
            padding: const EdgeInsets.all(20),
            child: Paragraph('Instructions:\n${item.description}')),
        Container(
            margin: EdgeInsets.symmetric(horizontal: margin),
            padding: const EdgeInsets.all(20),
            child: Paragraph('Bin Locations:\n${item.description}')),
      ]),
    );
  }
}
// Item | Image | Bin location | Description | Instructions

