import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_states.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';
import '../cubits/weather_cubit/weather_cubit.dart';
import 'search_view.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Weather? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.search_rounded,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return SearchView();
                  }),
                ).then((value) {
                  setState(() {
                    result = value;
                    log(result!.cityName);
                  });
                });
              }),
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherStates>(
        builder: (context, state) {
          if (state is GetWeatherSuccess) {
            return WeatherInfoBody(
                weatherModel:
                    BlocProvider.of<WeatherCubit>(context).weatherModel!);
          } else if (state is GetWeatherFaliur) {
            return Text(state.errorMessage);
          } else if (state is WeatherLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const NoWeatherBody();
          }
        },
      ),
    );
  }
}
