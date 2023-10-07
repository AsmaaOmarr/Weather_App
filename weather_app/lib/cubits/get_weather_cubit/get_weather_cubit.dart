import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weathermodel.dart';
import '../../services/weatherservices.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  WeatherModel? weatherModel;
  // initial state when first loaded state
  GetWeatherCubit() : super(NoWeatherState());

  getWeather({required String cityName}) async {
    try {
      weatherModel = await WeatherServices().getWeather(cityName: cityName);
      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
