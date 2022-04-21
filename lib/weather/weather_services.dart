import 'dart:convert';

import 'package:http/http.dart' as http;

import 'weathermodule.dart';


class DataService{
  Future<WeatherResponse> getWeather(String city) async
  {
    //api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    final queryParameters={'q':city,'appid':'29ec2eada9577f3d3e96936b3ba27eb8','units':'imperial'};
    final uri = Uri.https('api.openweathermap.org','/data/2.5/weather',queryParameters);
    final response = await http.get(uri);

    print(response.body);
    final json=jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}