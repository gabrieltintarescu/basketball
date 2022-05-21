import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'home_page.dart';
import 'menu_drawer.dart';

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final ZoomDrawerController z = ZoomDrawerController();

  var contentIndex = 0;

  Widget getScreen() {
    switch (contentIndex) {
      case 0:
        return HomePage();
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
        return HomePage();
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
      duration: const Duration(milliseconds: 300),
      menuBackgroundColor: const Color(0xFFDC5D1D),
      angle: 0.0,
      mainScreen: getScreen(),
      menuScreen: Menu(callback: changeContent),
    );
  }
}
