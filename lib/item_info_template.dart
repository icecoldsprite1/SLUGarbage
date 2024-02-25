import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slugarbage/main.dart';

class ItemInfo extends StatelessWidget {
  const ItemInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Scaffold(
      appBar: AppBar(title: Text(appState.pageItemName)),
    );
  }
}
