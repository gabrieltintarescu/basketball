import 'dart:io';

import 'package:basketball/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      // systemNavigationBarColor: Color(0xFFDC5D1D), // navigation bar color
      statusBarColor: Color(0xFFDC5D1D), // status bar color
    ));
  }
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BasketBall',
      theme: ThemeData(
          fontFamily: 'Sora',
          colorScheme: const ColorScheme.light()
              .copyWith(primary: const Color(0xFFDC5D1D))),
      themeMode: ThemeMode.light,
      home: const SplashScreen(),
    );
  }
}
