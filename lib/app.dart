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
        return const HomePage();
      case 1:
        return const Scaffold(
            backgroundColor: Color(0xFFEDEDED),
            body: Center(
                child:
                    Text('Pagina de profil', style: TextStyle(fontSize: 32))));
      case 2:
        return const Scaffold(
            backgroundColor: Color(0xFFEDEDED),
            body: Center(
                child:
                    Text('Pagina de mesaje', style: TextStyle(fontSize: 32))));
      case 3:
        return const Scaffold(
            backgroundColor: Color(0xFFEDEDED),
            body: Center(
                child:
                    Text('Pagina de setări', style: TextStyle(fontSize: 32))));
      default:
        return const HomePage();
    }
  }

  void changeContent(int index) {
    setState(() {
      contentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ZoomDrawer(
      controller: z,
      borderRadius: 24,
      style: DrawerStyle.defaultStyle,
      showShadow: true,
      openCurve: Curves.fastOutSlowIn,
      slideWidth: width > 410 ? width * 0.65 : width * 0.9,
      duration: const Duration(milliseconds: 300),
      menuBackgroundColor: Theme.of(context).primaryColor,
      angle: 0.0,
      mainScreen: getScreen(),
      menuScreen: Menu(callback: changeContent),
    );
  }
}
