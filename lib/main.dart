import 'package:basketball/splash_screen.dart';
import 'package:flutter/material.dart';

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
      home: const SplashScreen(),
    );
  }
}
