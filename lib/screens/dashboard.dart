import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Modules/details.dart';
import '../weather/weather_services.dart';
import '../weather/weathermodule.dart';

String? w1;

class DashBoard extends StatefulWidget {
  static const String id = 'dashboard_screen';

  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  WeatherResponse? _response;
  final DataService d1 = DataService();
  Extradetails e1 = Extradetails();

  void search() async {
    final response = await d1.getWeather('Mumbai');
    setState(() => _response = response);
  }

  @override
  void initState() {
    super.initState();
    search();
    // _cityTextEditingController.addListener(_printLatestValue);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(230, 255, 255, 1)),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text("AgroIT"),
          actions: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () async {
                final SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.setInt('Login_status', 0);
                Fluttertoast.showToast(
                  msg: "Logged Out Successfully",
                  toastLength: Toast.LENGTH_SHORT,
                );
                // Navigator.pushNamed(context, LoginScreen.id);
              },
              label: Text("Logout"),
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Hello, ",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Text(
                    "Farmer Name",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                if (_response != null)
                  Card(
                      elevation: 20,
                      color: Colors.green,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${_response?.tempinfo.temp}\u2109',
                                    style: const TextStyle(
                                        fontSize: 46,
                                        fontWeight: FontWeight.bold),
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
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "How can we help you?",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          w1 = '${_response?.tempinfo.temp}\u2109'.toString();
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(builder: (context) => Humidity(w1)),
                          // );
                        },
                        child: Card(
                            elevation: 20,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: SizedBox(
                              width: 160,
                              height: 160,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: const [
                                    Text(
                                      "Field Condition",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Image(
                                      image: AssetImage('assets/1.png'),
                                      height: 100,
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(context, WaterIrrigation.id);
                        },
                        child: Card(
                            elevation: 20,
                            color: const Color.fromRGBO(255, 230, 255, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: SizedBox(
                              width: 160,
                              height: 160,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: const [
                                    Text(
                                      "Water Irrigation",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Image(
                                      image: AssetImage('assets/3.png'),
                                      height: 100,
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(context, FetilizerSuggestion.id);
                        },
                        child: Card(
                            elevation: 20,
                            color: Color.fromRGBO(204, 238, 255, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: SizedBox(
                              width: 160,
                              height: 160,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: const [
                                    Text(
                                      "Fertilization",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Image(
                                      image: AssetImage('assets/5.png'),
                                      height: 100,
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                      const SizedBox(width: 8),
                      Align(
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.pushNamed(context, ScheduleP.id);
                          },
                          child: Card(
                              elevation: 20,
                              color: const Color.fromRGBO(204, 204, 255, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: SizedBox(
                                width: 160,
                                height: 160,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: const [
                                      Text(
                                        "Pesticides",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Image(
                                        image: AssetImage('assets/4.png'),
                                        height: 100,
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
