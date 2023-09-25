import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        title: const Text('Search'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextField(
          controller: controller,
          onSubmitted: (cityNameValue) {
            BlocProvider.of<WeatherCubit>(context).getWeather(cityNameValue);
            Navigator.pop(context);
          },
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            hintText: 'Enter The City Name',
            hintStyle: TextStyle(
              color: Colors.grey[500],
            ),
            label: const Text('Search'),
            labelStyle: const TextStyle(
              color: Colors.orange,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Colors.orange,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
