abstract class WeatherStates {}

class WeatherInitialState extends WeatherStates {}

class GetWeatherSuccess extends WeatherStates {}

class GetWeatherFaliur extends WeatherStates {
  final String errorMessage;

  GetWeatherFaliur({required this.errorMessage});
}

class WeatherLoadingState extends WeatherStates {}
