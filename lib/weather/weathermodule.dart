class TempratureInfo {
  final double temp;
  final double ltemp;
  final double htemp;

  TempratureInfo(
      {required this.ltemp, required this.htemp, required this.temp});

  factory TempratureInfo.fromJson(Map<String, dynamic> json) {
    final temp = json['temp'];
    final ltemp = json['temp_min'];
    final htemp = json['temp_max'];
    return TempratureInfo(temp: temp, htemp: htemp, ltemp: ltemp);
  }
}

class WeatherInfo {
  final String description;
  final String icon;

  WeatherInfo({required this.description, required this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    return WeatherInfo(description: description, icon: icon);
  }
}

class WeatherResponse {
  final String cityName;
  final DateTime date;
  final TempratureInfo tempinfo;
  final WeatherInfo weatherInfo;

  String get iconUrl {
    return 'http://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png';
  }

  WeatherResponse(
      {required this.cityName,
      required this.tempinfo,
      required this.weatherInfo,
      required this.date});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    // ignore: unused_local_variable, unnecessary_new
    final date = new DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000,
        isUtc: false);
    final cityName = json['name'];
    final tempinfojson = json['main'];
    final tempinfo = TempratureInfo.fromJson(tempinfojson);
    final weatherInfojson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfojson);

    return WeatherResponse(
        cityName: cityName,
        tempinfo: tempinfo,
        weatherInfo: weatherInfo,
        date: date);
  }
}
