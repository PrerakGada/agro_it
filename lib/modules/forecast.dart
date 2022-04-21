import '../weather/weatherdata.dart';

class ForeCastData {
  late final List list;

  ForeCastData({required this.list});

  factory ForeCastData.fromJson(Map<String, dynamic> json) {
    List list = List.empty();
    for (dynamic e in json['list']) {
      WeatherData w = WeatherData(
          date:
              DateTime.fromMillisecondsSinceEpoch(e['dt'] * 1000, isUtc: false),
          name: json['city']['name'],
          temp: e['main']['temp'].toDouble(),
          main: e['weather'][0]['main'],
          icon: e['weather'][0]['icon']);
      list.add(w);
    }

    return ForeCastData(
      list: list,
    );
  }
}
