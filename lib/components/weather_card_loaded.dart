import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/weather.dart';

import '../models/vreme.dart';

class WeatherCardLoaded extends StatelessWidget {
  final Weather weather;
  WeatherCardLoaded({Key? key, required this.weather}) : super(key: key);

  final Map<int, Vreme> convertWeatherCodes = {
    2: Vreme(title: 'Furtună', imagePath: 'assets/weather/storm.json'),
    3: Vreme(title: 'Ploaie ușoară', imagePath: 'assets/weather/rain.json'),
    5: Vreme(title: 'Ploaie', imagePath: 'assets/weather/rain.json'),
    6: Vreme(title: 'Ninsoare', imagePath: 'assets/weather/snow.json'),
    7: Vreme(title: 'Ceață', imagePath: 'assets/weather/mist.json'),
    8: Vreme(title: 'Însorit', imagePath: 'assets/weather/sunny.json'),
  };

  int firstDigit(int n) {
    // Remove last digit from number
    // till only one digit is left
    while (n >= 10) {
      n = n ~/ 10;
    }

    // return the first digit
    return n;
  }

  @override
  Widget build(BuildContext context) {
    Vreme? vreme;
    if (weather.weatherConditionCode! > 800) {
      vreme = Vreme(title: 'Înnorat', imagePath: 'assets/weather/cloudy.json');
    } else {
      vreme = convertWeatherCodes[firstDigit(weather.weatherConditionCode!)];
    }

    return Stack(children: [
      Padding(
        padding:
            const EdgeInsets.only(left: 25, right: 25, bottom: 20, top: 20),
        child: Container(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0, 10),
                  blurRadius: 12,
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 10),
              Column(
                children: [
                  const Text(
                    'Locația curentă',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    '${weather.areaName}',
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Container(
                  height: 0.5, width: 200, color: Colors.grey.withOpacity(0.5)),
              FittedBox(
                child: Text(
                  '${vreme?.title}, ${weather.temperature?.celsius?.toStringAsFixed(1)}°C',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        right: 10,
        top: -10,
        child: LottieBuilder.asset(
          vreme!.imagePath,
          height: 155,
        ),
      )
    ]);
  }
}
