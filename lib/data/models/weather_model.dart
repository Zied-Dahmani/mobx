class Weather{
  final String cityName;
  final double temperature;

  Weather(this.cityName, this.temperature);

  
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Weather &&
          runtimeType == other.runtimeType &&
          cityName == other.cityName &&
          temperature == other.temperature;

  @override
  int get hashCode => cityName.hashCode ^ temperature.hashCode;
}
