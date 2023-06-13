import '../models/weather_model.dart';

abstract class WeatherRepositoryInterface {
  Future<Weather> fetchWeather(String cityName);
}
