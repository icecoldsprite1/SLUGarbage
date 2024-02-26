import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slugarbage/buttons_info_template.dart';
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
    List<VoidCallback> buttonActions = [];
    List<String> buttonNames = [];

    // Define button actions based on the tab number
    if (tabNumber == 1) {
      buttonActions = [
        () {
          // Functionality for button A on Tab 1
          // For example:
          print('Button A on Tab 1 clicked!');
          appState.addPoints();
          appState.addRecent('Landfill 1');
        },
        () {
          // Functionality for button B on Tab 1
          // For example:
          print('Button B on Tab 1 clicked!');
          appState.addPoints();
          appState.addRecent('Landfill 2');
        },
        () {
          // Functionality for button A on Tab 1
          // For example:
          print('Button C on Tab 1 clicked!');
          appState.addPoints();
          appState.addRecent('Landfill 3');
        },
        () {
          // Functionality for button A on Tab 1
          // For example:
          print('Button D on Tab 1 clicked!');
          appState.addPoints();
          appState.addRecent('Landfill 4');
        },
        () {
          // Functionality for button A on Tab 1
          // For example:
          print('Button E on Tab 1 clicked!');
          appState.addPoints();
          appState.addRecent('Landfill 5');
        },
        // Define other button actions for Tab 1 here
      ];
      buttonNames = [
        'Landfill 1',
        'Landfill 2',
        'Landfill 3',
        'Landfill 4',
        'Landfill 5'
      ];
    } else if (tabNumber == 2) {
      buttonActions = [
        () {
          // Functionality for button 1 on Tab 2
          // For example:
          print('Button 1 on Tab 2 clicked!');
          appState.addPoints();
          appState.addRecent('Bin Recyclabes');
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) =>
                      const ButtonInfo(img: 'assets/images/recycle.png'))));
        },
        () {
          // Functionality for button 2 on Tab 2
          // For example:
          print('Button 2 on Tab 2 clicked!');
          appState.addPoints();
          appState.addRecent('Recycling Symbols');
        },
        () {
          // Functionality for button 1 on Tab 2
          // For example:
          print('Button 3 on Tab 2 clicked!');
          appState.addPoints();
          appState.addRecent('Special Recyclables');
        },
        () {
          // Functionality for button 1 on Tab 2
          // For example:
          print('Button 4 on Tab 2 clicked!');
          appState.addPoints();
          appState.addRecent('UCSC Recycling Instructions');
        },
        () {
          // Functionality for button 1 on Tab 2
          // For example:
          print('Button 5 on Tab 2 clicked!');
          appState.addPoints();
          appState.addRecent('What happens to my recyclables?');
        },
        // Define other button actions for Tab 2 here
      ];
      buttonNames = [
        'Bin Recyclabes',
        'Recycling Symbols',
        'Special Recyclabes',
        'UCSC Recycling Instructions',
        'What happens to my recyclables?'
      ];
    } else if (tabNumber == 3) {
      buttonActions = [
        () {
          // Functionality for option 1 on Tab 3
          // For example:
          print('Option 1 on Tab 3 clicked!');
          appState.addPoints();
          appState.addRecent('Compost 1');
        },
        () {
          // Functionality for option 2 on Tab 3
          // For example:
          print('Option 2 on Tab 3 clicked!');
          appState.addPoints();
          appState.addRecent('Compost 2');
        },
        () {
          // Functionality for option 1 on Tab 3
          // For example:
          print('Option 3 on Tab 3 clicked!');
          appState.addPoints();
          appState.addRecent('Compost 3');
        },
        () {
          // Functionality for option 1 on Tab 3
          // For example:
          print('Option 4 on Tab 3 clicked!');
          appState.addPoints();
          appState.addRecent('Compost 4');
        },
        () {
          // Functionality for option 1 on Tab 3
          // For example:
          print('Option 5 on Tab 3 clicked!');
          appState.addPoints();
          appState.addRecent('Compost 5');
        },
        // Define other button actions for Tab 3 here
      ];
      buttonNames = [
        'Compost 1',
        'Compost 2',
        'Compost 3',
        'Compost 4',
        'Compost 5'
      ];
    }

    return Center(
      child: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        children: List.generate(5, (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: buttonActions[
                  index], // Assign onPressed function based on index
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(buttonNames[index]), // Set text here
            ),
          );
        }),
      ),
    );
  }
}
