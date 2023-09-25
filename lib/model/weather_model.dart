import 'package:flutter/material.dart';

class Weather {
  final String cityName;
  final DateTime time;
  final String image;
  final double temp;
  final double minTemp;
  final double maxTemp;
  final String weatherCondition;

  const Weather({
    required this.cityName,
    required this.time,
    required this.image,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.weatherCondition,
  });

// To Convert The Map Into Object
  factory Weather.fromJson(json) {
    return Weather(
      cityName: json['location']['name'],
      time: DateTime.parse(json['location']['localtime']),
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
    );
  }
}
