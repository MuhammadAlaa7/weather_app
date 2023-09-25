import 'package:dio/dio.dart';

import '../model/weather_model.dart';

class WeatherService {
  static final Dio dio = Dio();

  static String baseUrl = 'https://api.weatherapi.com/v1';
  static String apiKey = '2c65759eb8a24a99b73194358232009';

  static Future<Weather> getWeather({required String countryName}) async {
    try {
      final Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$countryName&days=1');

      Map<String, dynamic> json = response.data;

      Weather weatherModel = Weather.fromJson(json);

      return weatherModel;
      // if the response status code is not correct => is not 200 the dio package knows that and will catch the error
      // while using dio package , you don't have to deal with the status code by if condition to deal with every error
    } on DioException catch (exception) {
      // This catech is specific for the status codes
      // the response of the error may be null , may be [ page not found error ]
      //so I am telling it that it may be null , so if it is give it another errorMessage
      final String errorMessage =
          exception.response?.data['error']['message'] ?? 'Page not found';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('unknow error please try again later  ');
    }
  }
}
