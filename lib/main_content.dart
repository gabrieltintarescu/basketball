import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:lottie/lottie.dart';

class MainContent extends StatelessWidget {
  const MainContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEDED),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/basketball.json',
            height: MediaQuery.of(context).size.height * 0.6,
          ),
          const Center(
            child: Text(
              'Press to open menu',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 25),
          IconButton(
              onPressed: (() => ZoomDrawer.of(context)?.toggle()),
              icon: const Icon(CupertinoIcons.bars)),
        ],
      ),
    );
  }
}
