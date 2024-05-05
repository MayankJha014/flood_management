// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// instance for getting the api response
class WeatherDataCurrent {
  final Current? current; // Allow current to be null

  WeatherDataCurrent({required this.current});

  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) {
    return WeatherDataCurrent(
      current: json['current'] != null
          ? Current.fromJson(json['current'] as String)
          : null, // Assign null if json['current'] is null
    );
  }
}

class Current {
  int? temp;
  int? humidity;
  int? clouds;
  double? uvIndex;
  double? feelsLike;
  double? windSpeed;
  List<Weather>? weather;
  Current({
    required this.temp,
    required this.humidity,
    required this.clouds,
    required this.uvIndex,
    required this.feelsLike,
    required this.windSpeed,
    required this.weather,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temp': temp,
      'humidity': humidity,
      'clouds': clouds,
      'uvi': uvIndex,
      'feels_like': feelsLike,
      'wind_speed': windSpeed,
      'weather': weather!.map((x) => x).toList(),
    };
  }

  factory Current.fromMap(Map<String, dynamic> map) {
    return Current(
      temp: map['temp'] != null ? map['temp'] as int : null,
      humidity: map['humidity'] != null ? map['humidity'] as int : null,
      clouds: map['clouds'] != null ? map['clouds'] as int : null,
      uvIndex: map['uvi'] != null ? map['uvi'] as double : null,
      feelsLike: map['feels_like'] != null ? map['feels_like'] as double : null,
      windSpeed: map['wind_speed'] != null ? map['wind_speed'] as double : null,
      weather: map['weather'] != null
          ? List<Weather>.from(
              (map['weather'] as List<int>).map<Weather?>(
                (x) => Weather.fromJson(x as Map<String, dynamic>),
              ),
            )
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory Current.fromJson(String source) =>
      Current.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  // from json
  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json['id'] as int?,
        main: json['main'] as String?,
        description: json['description'] as String?,
        icon: json['icon'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
      };
}
