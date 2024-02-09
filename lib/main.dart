import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slugarbage/text_input_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'SLUGarbage',
        theme: ThemeData(
            appBarTheme: AppBarTheme(backgroundColor: Colors.yellow.shade600),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent)),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = '';

  void text(String stuff) {
    current = stuff;
    notifyListeners();
  }

  var names = <String>[];

  void toggleNames() {
    if (names.contains(current)) {
      names.remove(current);
    } else {
      names.add(current);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SLUGarbage')),
      body: TextInputWidget(),
    );
  }
}
