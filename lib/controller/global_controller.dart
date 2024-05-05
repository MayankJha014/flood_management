import 'package:flood_management/api/fetch_weather.dart';
import 'package:flood_management/model/weather_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

final userLocation = StateProvider<Placemark?>((ref) => null);
final climateProvider = StateProvider<WeatherData?>((ref) => null);

final globalControllerProvider = StateNotifierProvider<GlobalController, bool>(
    (ref) => GlobalController(ref: ref));

class GlobalController extends StateNotifier<bool> {
  final Ref _ref;

  GlobalController({required Ref ref})
      : _ref = ref,
        super(false);

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    // return if service is not enabled
    if (!isServiceEnabled) {
      return Future.error("Location not enabled");
    }

    // status of permission
    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permission are denied forever");
    } else if (locationPermission == LocationPermission.denied) {
      // request permission
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location permission is denied");
      }
    }

    // getting the currentposition
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) async {
      print(value);
      List<Placemark> placemark =
          await placemarkFromCoordinates(value.latitude, value.longitude);
      Placemark place = placemark[0];
      print(place);
      _ref.read(userLocation.notifier).update((state) => place);

      FetchWeatherAPI()
          .processData(value.latitude, value.longitude)
          .then((weather) {
        print(weather);
        _ref.read(climateProvider.notifier).update((state) => weather);
      });
    });
  }
}
