import 'package:flutter/material.dart';
import 'package:mobx_test/presentation/screens/weather_screen.dart';
import 'package:provider/provider.dart';
import 'data/repositories/weather_repository.dart';
import 'logic/states/weather_store.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MobX',
      debugShowCheckedModeBanner: false,
      home: Provider(
        create: (context) => WeatherStore(WeatherRepository()),
        child: const WeatherScreen(),
      ),
    );
  }
}
