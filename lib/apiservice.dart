import 'package:fitness/main.dart';
import 'package:fitness/weather.dart';
import 'package:dio/dio.dart';


final dio = Dio();

class ApiService {
  // If json starts form json array we should call Future<List<Weather>>
  // If json starts from json object we should call Future<Weather>

  Future<Welcome> getWeather() async {
    var response = await Dio().get(
        "https://api.openweathermap.org/data/2.5/weather?lat=${pos?.latitude}&lon=${pos?.longitude}&appid=61a90cf7d11792e5026334e8977e94d2&units=Metric");

    print("ResponseData : ${response.toString()}");
    var weather = welcomeFromJson(response.toString());

    print("weather ${weather.name}");

    return weather;
  }
}
