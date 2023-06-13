import '../models/weather_model.dart';
import 'weather_repository_interface.dart';

class WeatherRepository implements WeatherRepositoryInterface {
  @override
  Future<Weather> fetchWeather(String cityName) {
    return Future.delayed(const Duration(seconds: 1), () {
      return Weather(cityName, 31);
    });
  }
}
