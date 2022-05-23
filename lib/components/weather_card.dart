import 'package:basketball/components/weather_card_loaded.dart';
import 'package:basketball/components/weather_card_loading.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class WeatherCard extends StatefulWidget {
  const WeatherCard({Key? key}) : super(key: key);

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  final WeatherFactory wf = WeatherFactory(
    "997fed4508a28ef6b62f8b81ef1f8257",
    language: Language.ROMANIAN,
  );

  Weather? currentWeather;

  @override
  void initState() {
    super.initState();
    loadWeather();
  }

  void loadWeather() async {
    var w = await wf.currentWeatherByCityName('Bucharest');
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      currentWeather = w;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentWeather == null) {
      return const WeatherCardLoading();
    } else {
      return WeatherCardLoaded(weather: currentWeather!);
    }
  }
}
