import 'package:mobx/mobx.dart';
import '../../data/models/weather_model.dart';
import '../../data/repositories/weather_repository_interface.dart';
part 'weather_store.g.dart';

class WeatherStore extends _WeatherStore with _$WeatherStore {
  WeatherStore(WeatherRepositoryInterface weatherRepository) : super(weatherRepository);
}

enum StoreState { initial, loading, loaded }

abstract class _WeatherStore with Store {
  final WeatherRepositoryInterface _weatherRepository;

  _WeatherStore(this._weatherRepository);

  @observable
  ObservableFuture<Weather>? _weatherFuture;
  @observable
  Weather? weather;
  @observable
  String? errorMessage;

  @computed
  StoreState get state {
    // If the user has not yet searched for a weather forecast or there has been an error
    if (_weatherFuture == null ||
        _weatherFuture!.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    // Pending Future means "loading"
    // Fulfilled Future means "loaded"
    return _weatherFuture?.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }

  @action
  Future getWeather(String cityName) async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // Fetch weather from the repository and wrap the regular Future into an observable.
      // This _weatherFuture triggers updates to the computed state property.
      _weatherFuture =
          ObservableFuture(_weatherRepository.fetchWeather(cityName));
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      weather = (await _weatherFuture)!;
    } catch (e) {
      errorMessage = "Couldn't fetch weather. Is the device online?";
    }
  }
}
