import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slugarbage/main.dart';
import 'package:slugarbage/search_bar.dart';

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
      appBar: TabBar(
        indicatorColor: Colors.amber,
        controller: _tabController,
        tabs: const [
          Tab(text: 'Landfill'),
          Tab(text: 'Recycle'),
          Tab(text: 'Compost'),
        ],
      ),
      body: Column(
        children: [
          const SearchingBar(),
          Flexible(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildTabContent(1),
                _buildTabContent(2),
                _buildTabContent(3),
              ],
            ),
          ),
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
                setState(() {
                  buttonText = 'Button ${index + 1} clicked!';
                });
                appState.addPoints();
                appState.addRecent('Button ${index + 1}');
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
