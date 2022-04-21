// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'weathermodule.dart';


class WeatherItem extends StatelessWidget {
  final WeatherResponse weather;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  WeatherItem({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(weather.cityName, style: const TextStyle(color: Colors.black)),
            Text(weather.weatherInfo.description, style: const TextStyle(color: Colors.black, fontSize: 24.0)),
            Text('${weather.tempinfo.temp}°F',  style: const TextStyle(color: Colors.black)),
            Image.network('https://openweathermap.org/img/w/${weather.weatherInfo.icon}.png'),
            Text(DateFormat.yMMMd().format(weather.date), style: const TextStyle(color: Colors.black)),
            // ignore: unnecessary_new
            Text(new DateFormat.Hm().format(weather.date), style: const TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}