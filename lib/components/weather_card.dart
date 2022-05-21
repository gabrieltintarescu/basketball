import 'package:basketball/components/weather_card_loaded.dart';
import 'package:basketball/components/weather_card_loading.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class WeatherCard extends StatelessWidget {
  WeatherCard({Key? key}) : super(key: key);
  final WeatherFactory wf = WeatherFactory(
    "997fed4508a28ef6b62f8b81ef1f8257",
    language: Language.ROMANIAN,
  );
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: wf.currentWeatherByCityName('Bucharest'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return WeatherCardLoaded(weather: snapshot.data as Weather);
        } else {
          return const WeatherCardLoading();
        }
      },
    );
  }
}
