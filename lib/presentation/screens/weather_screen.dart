import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import '../../logic/states/weather_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherStore? _weatherStore;
  List<ReactionDisposer>? _disposers;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _weatherStore ??= Provider.of<WeatherStore>(context, listen: false);
    _disposers ??= [
      reaction(
        (_) => _weatherStore!.errorMessage,
        (String? message) {
          print(message);
        },
      ),
    ];
  }

  @override
  void dispose() {
    _disposers!.forEach((d) => d());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Observer(
          builder: (_) {
            switch (_weatherStore!.state) {
              case StoreState.initial:
                return IconButton(
                    onPressed: () {
                      _weatherStore!.getWeather("Tunis");
                    }, icon: const Icon(Icons.sunny));
              case StoreState.loading:
                return const CircularProgressIndicator();
              case StoreState.loaded:
                return Text(_weatherStore!.weather!.temperature.toString());
            }
          },
        ),
      ),
    );
  }
}
