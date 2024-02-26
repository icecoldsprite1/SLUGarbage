import 'package:flutter/material.dart';

class ButtonInfo extends StatelessWidget {
  final String img;
  const ButtonInfo({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    var myHeight = MediaQuery.of(context).size.height * 0.4;
    var myWidth = MediaQuery.of(context).size.width * 0.7;
    double screenWidth = MediaQuery.of(context).size.width;
    double margin = screenWidth * 0.1;
    return Scaffold(
        appBar: AppBar(title: const Text('HELP ME PLEASE')),
        body: ListView(
          children: [
            Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                SizedBox(
                  height: myHeight,
                  width: myWidth,
                  child: Image.asset(img),
                ),
              ],
            ))
          ],
        ));
  }
}
