import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slugarbage/app_state.dart';
import 'package:slugarbage/main.dart';
import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider, PhoneAuthProvider;
import 'authentication.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Column(children: [
      const SizedBox(height: 20),
      Consumer<ApplicationState>(
        builder: (context, appState, _) => AuthFunc(
            loggedIn: appState.loggedIn,
            signOut: () {
              FirebaseAuth.instance.signOut();
            }),
      ),
      Center(
        child: Text(
          'Hello, ${appState.current}',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey[900],
          ),
        ),
      ),
      const SizedBox(height: 20),
      const HomePageContainer(
          text:
              'Welcome to SLUGarbage. This is a place to learn about how to properly dispose of items. Start by tapping on the search icon. The map locates places where the proper disposal bin is located. Earn points by searching.'),
      const SizedBox(height: 20),
      HomePageContainer(text: 'Points: ${appState.points}'),
      const SizedBox(height: 20),
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomePageContainer(text: 'Recents:'),
          SizedBox(height: 200, child: Recents()),
        ],
      )
    ]);
  }
}

class HomePageContainer extends StatelessWidget {
  final String text;

  const HomePageContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double margin = screenWidth * 0.1;
    return Container(
        margin: EdgeInsets.symmetric(horizontal: margin),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Center(child: Text(text, style: const TextStyle(fontSize: 16))));
  }
}

class Recents extends StatelessWidget {
  const Recents({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var stuff = appState.recents;
    double screenWidth = MediaQuery.of(context).size.width;
    double margin = screenWidth * 0.1;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ListView.builder(
        reverse: true,
        itemCount: stuff.length,
        itemBuilder: ((context, index) {
          return ListTile(title: Text(stuff[index]));
        }),
      ),
    );
  }
}
