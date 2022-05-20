import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import 'app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.bottomToTop,
          duration: const Duration(milliseconds: 550),
          child: const MainApp(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.asset('assets/basketball.json'),
              Transform.translate(
                offset: const Offset(0, -30),
                child: const Text(
                  'Facem încălzirea..',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                width: 100,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey[500],
                  minHeight: 2,
                  color: const Color(0xFFFA4A0C),
                ),
              )
            ],
          ),
        ),
        Column(
          children: [
            Expanded(child: Container()),
            const Text(
              '© 2022 Gabriel Țintărescu',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
            ),
            const SizedBox(height: 10),
          ],
        )
      ]),
    );
  }
}
