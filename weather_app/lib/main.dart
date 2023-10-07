// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/pages/homepage.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherStates>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherStatus),
              ),
              title: "Weather App",
              debugShowCheckedModeBanner: false,
              home: HomePage(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getThemeColor(String? weatherStatus) {
  if (weatherStatus == null) {
    return Colors.blue;
  }
  if (weatherStatus == 'Sunny') {
    return Colors.amber;
  } else if (weatherStatus == 'Partly cloudy') {
    return Colors.yellow;
  } else if (weatherStatus == 'Cloudy' || weatherStatus == 'Overcast') {
    return Colors.grey;
  } else if (weatherStatus == 'Mist' ||
      weatherStatus == 'Fog' ||
      weatherStatus == 'Freezing fog') {
    return Colors.grey;
  } else if (weatherStatus.contains('Rain') ||
      weatherStatus.contains('Drizzle')) {
    return Colors.lightBlue;
  } else if (weatherStatus.contains('Snow') ||
      weatherStatus.contains('Sleet') ||
      weatherStatus.contains('Ice')) {
    return Colors.lightBlue;
  } else if (weatherStatus.contains('Thunder') ||
      weatherStatus.contains('Blizzard') ||
      weatherStatus.contains('Pellets')) {
    return Colors.indigo;
  } else {
    return Colors.blue;
  }
}
