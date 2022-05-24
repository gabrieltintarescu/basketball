import 'dart:io';

import 'package:basketball/components/weather_card.dart';
import 'package:basketball/models/court_item.dart';
import 'package:entry/entry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'components/court_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final courtList = [
    Court(
        imagePath: 'assets/basketball-ball.png',
        name: 'Tei',
        description: 'Teren bun și liber bun pentru orice ocazie.',
        rating: 5),
    Court(
        imagePath: 'assets/basketball-ball.png',
        name: 'Tineret',
        description: 'Nu e cel mai bun dar își face treaba.',
        rating: 3),
    Court(
        imagePath: 'assets/basketball-ball.png',
        name: 'Plumbuita',
        description: 'Liniștit și ușor de ajuns.',
        rating: 4),
    Court(
        imagePath: 'assets/basketball-ball.png',
        name: 'În curând..',
        description: 'Vom adăuga mai multe terenuri de baschet.',
        rating: 0),
  ];

  var selectedCourt = 0;

  void selectCourt(int index) {
    if (index == selectedCourt) {
      return;
    }
    setState(() {
      selectedCourt = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEDED),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Image.asset('assets/menu.png'),
                      onPressed: () => ZoomDrawer.of(context)?.toggle()),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Cum e vremea?',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 32),
              ),
            ),
            const Entry(
              xOffset: -500,
              delay: Duration(milliseconds: 450),
              duration: Duration(milliseconds: 700),
              curve: Curves.ease,
              child: WeatherCard(),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                ' Unde jucăm azi?',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 32),
              ),
            ),
            const SizedBox(height: 15),
            Entry(
              xOffset: 500,
              delay: const Duration(milliseconds: 200),
              duration: const Duration(milliseconds: 700),
              curve: Curves.ease,
              child: SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: courtList.length,
                  itemBuilder: (context, index) {
                    return CourtCard(
                      index: index,
                      name: courtList[index].name,
                      description: courtList[index].description,
                      rating: courtList[index].rating,
                      imagePath: courtList[index].imagePath,
                      isSelected: selectedCourt == index,
                      selectCourtHandle: selectCourt,
                      isDisabled: index == courtList.length - 1,
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Entry(
                yOffset: 500,
                delay: const Duration(milliseconds: 600),
                duration: const Duration(milliseconds: 700),
                curve: Curves.ease,
                child: Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(10),
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFFDC691D)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: Text(
                        "HAI LA BASCHET",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.7),
                      ),
                    ),
                    onPressed: () => showPlatformDialog(
                      context,
                      courtList[selectedCourt],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}

void showPlatformDialog(BuildContext context, Court court) {
  if (Platform.isIOS) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('Vrei la baschet in ${court.name}?'),
            content: const Text('Cu prietenii tai la terenul de joaca ales.'),
            actions: [
              CupertinoDialogAction(
                child: const Text('Da'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              CupertinoDialogAction(
                child: const Text('Nu'),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  } else {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Vrei la baschet in ${court.name}?',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            content: const Text('Cu prietenii tai la terenul de joaca ales.'),
            actionsAlignment: MainAxisAlignment.spaceEvenly,
            actionsPadding: const EdgeInsets.only(bottom: 10),
            actions: [
              TextButton(
                child: const Text(
                  'DA',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: const Text('NU',
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }
}
