import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import './menu_drawer.dart';
import './main_content.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BasketBall',
      theme: ThemeData(fontFamily: 'Sora'),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ZoomDrawerController z = ZoomDrawerController();

  var contentIndex = 0;

  Widget getScreen() {
    switch (contentIndex) {
      case 0:
        return const MainContent();
      case 1:
        return const Scaffold(
            backgroundColor: Color(0xFFEDEDED),
            body: Center(
                child: Text('Orders page', style: TextStyle(fontSize: 32))));
      case 2:
        return const Scaffold(
            backgroundColor: Color(0xFFEDEDED),
            body: Center(
                child: Text('Security page', style: TextStyle(fontSize: 32))));
      case 3:
        return const Scaffold(
            backgroundColor: Color(0xFFEDEDED),
            body: Center(
                child: Text('Settings page', style: TextStyle(fontSize: 32))));
      default:
        return const MainContent();
    }
  }

  void changeContent(int index) {
    setState(() {
      contentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
        controller: z,
        borderRadius: 24,
        style: DrawerStyle.defaultStyle,
        showShadow: true,
        openCurve: Curves.fastOutSlowIn,
        slideWidth: MediaQuery.of(context).size.width * 0.65,
        duration: const Duration(milliseconds: 700),
        menuBackgroundColor: const Color(0xFFFA4A0C),
        angle: 0.0,
        mainScreen: getScreen(),
        menuScreen: Menu(callback: changeContent));
  }
}
