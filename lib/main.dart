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
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final ZoomDrawerController z = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
        controller: z,
        borderRadius: 24,
        style: DrawerStyle.defaultStyle,
        showShadow: true,
        openCurve: Curves.fastOutSlowIn,
        slideWidth: MediaQuery.of(context).size.width * 0.65,
        duration: const Duration(milliseconds: 500),
        menuBackgroundColor: const Color(0xFFFA4A0C),
        angle: 0.0,
        mainScreen: const MainContent(),
        menuScreen: Menu());
  }
}
