import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_states.dart';

import '../../model/weather_model.dart';
import '../../services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit() : super(WeatherInitialState());

  // third thing is to create a method for the logic

  Weather? weatherModel;

  void getWeather(String cityName) async {
    try {
      // until the data comes send the loading state
      emit(WeatherLoadingState());

      weatherModel = await WeatherService.getWeather(countryName: cityName);
      emit(GetWeatherSuccess());
    } catch (error) {
      emit(GetWeatherFaliur(
        errorMessage: error.toString(),
      ));
    }
  }

  MaterialColor getWeatherTheme(String? weatherCondition) {
    const customWhite = MaterialColor(
      0xFFFFFFFF, // this the primary color
      <int, Color>{
        50: Colors.white,
        100: Colors.white,
        200: Colors.white,
        300: Colors.white,
        400: Colors.white,
        500: Colors.white,
        600: Colors.white,
        700: Colors.white,
        800: Colors.white,
        900: Colors.white,
      },
    );

    switch (weatherCondition) {
      case 'Sunny':
      case 'Clear':
        return Colors.yellow;
      case 'Partly cloudy':
        return Colors.orange;
      case 'Cloudy':
        return Colors.blueGrey;
      case 'Overcast':
      case 'Mist':
      case 'Fog':
      case 'Freezing fog':
        return Colors.grey;
      case 'Patchy rain possible':
      case 'Light drizzle':
      case 'Patchy light drizzle':
      case 'Patchy light rain':
      case 'Light rain':
      case 'Moderate rain at times':
      case 'Moderate rain':
      case 'Heavy rain at times':
      case 'Heavy rain':
      case 'Light freezing rain':
      case 'Moderate or heavy freezing rain':
        return Colors.blue;
      case 'Patchy snow possible':
      case 'Patchy sleet possible':
      case 'Patchy freezing drizzle possible':
      case 'Blowing snow':
      case 'Blizzard':
      case 'Patchy light snow':
      case 'Light snow':
      case 'Patchy moderate snow':
      case 'Moderate snow':
      case 'Patchy heavy snow':
      case 'Heavy snow':
        return customWhite;
      case 'Thundery outbreaks possible':
      case 'Patchy light rain with thunder':
      case 'Moderate or heavy rain with thunder':
      case 'Patchy light snow with thunder':
      case 'Moderate or heavy snow with thunder':
        return Colors.deepPurple;
      case 'Ice pellets':
      case 'Light rain shower':
      case 'Moderate or heavy rain shower':
      case 'Torrential rain shower':
      case 'Light sleet showers':
      case 'Moderate or heavy sleet showers':
      case 'Light snow showers':
      case 'Moderate or heavy snow showers':
      case 'Light showers of ice pellets':
      case 'Moderate or heavy showers of ice pellets':
        return Colors.blue;
      default:
        return Colors
            .blue; // Default color when no match is found. or received null value
    }
  }
}
