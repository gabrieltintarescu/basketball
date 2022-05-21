import 'package:basketball/components/weather_card.dart';
import 'package:basketball/models/court_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'components/court_card.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  var courtList = [
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
        name: 'În curând..',
        description: 'Vom adăuga mai multe terenuri de baschet.',
        rating: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEDED),
      body: SafeArea(
        child: SingleChildScrollView(
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
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  ' Unde jucăm azi?',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 32),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: courtList.length,
                  itemBuilder: (context, index) {
                    return CourtCard(
                      name: courtList[index].name,
                      description: courtList[index].description,
                      rating: courtList[index].rating,
                      imagePath: courtList[index].imagePath,
                    );
                  },
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
              WeatherCard(),
              const SizedBox(height: 10),
              Center(
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
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      child: Text(
                        "HAI LA BASCHET",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    onPressed: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
