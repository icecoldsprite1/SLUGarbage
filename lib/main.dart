import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slugarbage/text_input_widget.dart';

import 'home_page.dart';
import 'info_page.dart';
import 'map_page.dart';

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

  int points = 0;
  void addPoints() {
    points++;
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
    const HomePage(),
    const InfoPage(),
    MapPage(),
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

      // Top App Bar
      appBar: AppBar(
        title: const Text('SLUGarbage'),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        selectedIconTheme: const IconThemeData(color: Colors.amber),
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map')
        ],
      ),
    );
  }
}

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info Page'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Landfill'),
            Tab(text: 'Recycle'),
            Tab(text: 'Compost'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTabContent(1),
          _buildTabContent(2),
          _buildTabContent(3),
        ],
      ),
    );
  }

  Widget _buildTabContent(int tabNumber) {
    var appState = context.watch<MyAppState>();
    var buttonText = '';
    return Center(
      child: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        children: List.generate(5, (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Button action
                appState.addPoints();
                setState(() {
                  buttonText = 'Button ${index + 1} clicked!';
                });
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text('Button ${index + 1}'),
            ),
          );
        }),
      ),
    );
  }
}
