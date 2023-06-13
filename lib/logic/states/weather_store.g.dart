// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WeatherStore on _WeatherStore, Store {
  Computed<StoreState>? _$stateComputed;

  @override
  StoreState get state => (_$stateComputed ??=
          Computed<StoreState>(() => super.state, name: '_WeatherStore.state'))
      .value;

  late final _$_weatherFutureAtom =
      Atom(name: '_WeatherStore._weatherFuture', context: context);

  @override
  ObservableFuture<Weather>? get _weatherFuture {
    _$_weatherFutureAtom.reportRead();
    return super._weatherFuture;
  }

  @override
  set _weatherFuture(ObservableFuture<Weather>? value) {
    _$_weatherFutureAtom.reportWrite(value, super._weatherFuture, () {
      super._weatherFuture = value;
    });
  }

  late final _$weatherAtom =
      Atom(name: '_WeatherStore.weather', context: context);

  @override
  Weather? get weather {
    _$weatherAtom.reportRead();
    return super.weather;
  }

  @override
  set weather(Weather? value) {
    _$weatherAtom.reportWrite(value, super.weather, () {
      super.weather = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_WeatherStore.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$getWeatherAsyncAction =
      AsyncAction('_WeatherStore.getWeather', context: context);

  @override
  Future<dynamic> getWeather(String cityName) {
    return _$getWeatherAsyncAction.run(() => super.getWeather(cityName));
  }

  @override
  String toString() {
    return '''
weather: ${weather},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
