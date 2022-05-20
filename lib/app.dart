import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:weather/weather.dart';

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
  Weather? currentWeather;

  WeatherFactory wf = WeatherFactory("997fed4508a28ef6b62f8b81ef1f8257",
      language: Language.ROMANIAN);

  @override
  void initState() {
    super.initState();
    loadWeather();
  }

  void loadWeather() async {
    currentWeather = await wf.currentWeatherByCityName('Bucharest');
    setState(() {
      print('da');
    });
  }

  Widget getScreen() {
    switch (contentIndex) {
      case 0:
        return HomePage(currentWeather: currentWeather);
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
        return HomePage(
          currentWeather: currentWeather,
        );
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
      duration: const Duration(milliseconds: 550),
      menuBackgroundColor: const Color(0xFFFA4A0C),
      angle: 0.0,
      mainScreen: getScreen(),
      menuScreen: Menu(callback: changeContent),
    );
  }
}
