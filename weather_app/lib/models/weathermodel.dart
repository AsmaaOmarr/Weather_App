// ignore_for_file: public_member_api_docs, sort_constructors_first
class WeatherModel {

  final String city;
  final double minTemp;
  final double maxTemp;
  final double avgTemp;
  final String? img;
  final String weatherStatus;
  final DateTime lastUpdateTime;

  WeatherModel({
    required this.city,
    required this.minTemp,
    required this.maxTemp,
    required this.avgTemp,
    this.img,
    required this.weatherStatus,
    required this.lastUpdateTime,
  });
  
  factory WeatherModel.fromJson(json){

    return WeatherModel(
      city: json['location']['name'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      avgTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      img: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      weatherStatus: json['forecast']['forecastday'][0]['day']['condition']['text'],
      lastUpdateTime: DateTime.parse(json['current']['last_updated']),
    );

  }

}
