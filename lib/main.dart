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
        home: const LoginPage(),
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

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SLUGarbage')),
      body: TextInputWidget(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var currentIndex = 0;
  final List<Widget> pages = [
    TextInputWidget(),
    const MapPage(),
    const MapPage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      appBar: AppBar(
        title: const Text('SLUGarbage'),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
          ]),
    );
  }
}

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text("hello"));
  }
}
