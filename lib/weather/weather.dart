import 'package:agro_it/weather/weather_services.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:flutter/material.dart';

import '../modules/details.dart';
import '../modules/forecast.dart';
import 'weatherdata.dart';
import 'weathermodule.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  final _cityTextEditingController = TextEditingController();
  final DataService d1 = DataService();
  WeatherResponse? _response;
  WeatherData? weatherData;
  ForeCastData? foreCastData;
  Extradetails e1 = Extradetails();

  @override
  void initState() {
    super.initState();
    // _cityTextEditingController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    _cityTextEditingController.dispose();
    super.dispose();
  }

  /*void _printLatestValue() {
    print('Second text field: ${_cityTextEditingController.text}');
  }*/

  void search() async {
    final response = await d1.getWeather(_cityTextEditingController.text);
    setState(() => _response = response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrieve Text Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_response != null)
              Card(
                  elevation: 20,
                  color: Colors.cyanAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SizedBox(
                    width: e1.width(context),
                    height: 160,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${_response?.tempinfo.temp}\u2103',
                                style: const TextStyle(
                                    fontSize: 46, fontWeight: FontWeight.bold),
                              ),
                              Image.network(_response!.iconUrl,
                                  color: Colors.black),
                            ],
                          ),
                          Text(
                            '${_response?.weatherInfo.description}',
                            style: const TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            TextField(
              controller: _cityTextEditingController,
            ),
            Container(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  search();
                },
                child: const Text("Search"))
          ],
        ),
      ),
    );
  }
}
