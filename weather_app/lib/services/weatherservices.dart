// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:weather_app/models/weathermodel.dart';

class WeatherServices {
  final Dio dio = Dio();
  String baseUrl = 'https://api.weatherapi.com/v1';
  String apiKey = 'aecf60d5a631493b8a5121622230610';

  WeatherServices();

  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      final response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'Oops there was an error,try Later';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('Oops something went wrong!');
    }
  }
}
