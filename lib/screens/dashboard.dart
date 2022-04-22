import 'package:agro_it/screens/FertilizationScreen.dart';
import 'package:agro_it/screens/Pesticides.dart';
import 'package:agro_it/screens/ProfileScreen.dart';
import 'package:agro_it/screens/WaterIrrigationScreen.dart';
import 'package:agro_it/screens/fieldConditionScreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Modules/details.dart';
import '../weather/weather_services.dart';
import '../weather/weathermodule.dart';
import 'LoginScreen.dart';

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
    final dataa = _response?.tempinfo.temp;
    final temp = ((dataa! - 32) * 5 / 9).toInt();
    // final ldata = _response?.tempinfo.ltemp;
    // final ltemp = ((ldata! - 32) * 5 / 9).toInt();
    // final hdata = _response?.tempinfo.htemp;
    // final htemp = ((hdata! - 32) * 5 / 9).toInt();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // scaffoldBackgroundColor: HexColor('53B466')),
          scaffoldBackgroundColor: const Color.fromRGBO(230, 255, 255, 1)),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              final SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              sharedPreferences.setInt('Login_status', 0);
              Fluttertoast.showToast(
                msg: "Logged Out Successfully",
                toastLength: Toast.LENGTH_SHORT,
              );
              Navigator.popAndPushNamed(context, LoginScreen.id);
            },
          ),
          backgroundColor: HexColor('53B466'),
          title: Center(child: Text("AgroIT")),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, ProfileScreen.id);
              },
              icon: Icon(Icons.account_circle_outlined),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // const Padding(
                //   padding: EdgeInsets.all(8.0),
                //   child: Text(
                //     "Hello, ",
                //     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                //   ),
                // ),
                // const Padding(
                //   padding: EdgeInsets.only(left: 8.0, right: 8.0),
                //   child: Text(
                //     "Farmer Name",
                //     style: TextStyle(
                //       fontSize: 25,
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 20,
                ),
                if (_response != null)
                  Card(
                    elevation: 20,
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SizedBox(
                      width: e1.width(context),
                      // height: 160,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${_response?.cityName}',
                              style: const TextStyle(
                                fontSize: 30,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${temp}°',
                              style: const TextStyle(
                                fontSize: 70,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${_response?.weatherInfo.description}'.replaceFirst('h', 'H'),
                              style: const TextStyle(
                                fontSize: 24,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'H:${temp+1}°',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'L:${temp-2}°',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // w1 = '${_response?.tempinfo.temp}\u2109'.toString();
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(builder: (context) => Humidity(w1)),
                          // );
                          Navigator.pushNamed(context, FieldConditionScreen.id);
                        },
                        child: Card(
                          elevation: 20,
                          color: HexColor('53B466'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment(0, 1),
                                // 10% of the width, so there are ten blinds.
                                colors: <HexColor>[
                                  HexColor('56ab2f'),
                                  HexColor('a8e063'),
                                ],
                                // red to yellow
                              ),
                            ),
                            child: SizedBox(
                              width: e1.width(context) / 2.4,
                              // width: 160,
                              height: 160,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: const [
                                    Text(
                                      "Field Condition",
                                      style: TextStyle(
                                          color: Colors.white,
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
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, WaterIrrigationScreen.id);
                        },
                        child: Card(
                            elevation: 20,
                            color: HexColor('53B466'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment(0, 1),
                                  // 10% of the width, so there are ten blinds.
                                  colors: <HexColor>[
                                    HexColor('56ab2f'),
                                    HexColor('a8e063'),
                                  ],
                                  // red to yellow
                                ),
                              ),
                              child: SizedBox(
                                // width: 160,
                                width: e1.width(context) / 2.4,
                                height: 160,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: const [
                                      Text(
                                        "Water Irrigation",
                                        style: TextStyle(
                                            color: Colors.white,
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
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, FertilizationScreen.id);
                        },
                        child: Card(
                            elevation: 20,
                            color: HexColor('53B466'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment(0, 1),
                                  // 10% of the width, so there are ten blinds.
                                  colors: <HexColor>[
                                    HexColor('56ab2f'),
                                    HexColor('a8e063'),
                                  ],
                                  // red to yellow
                                ),
                              ),
                              child: SizedBox(
                                // width: 160,
                                width: e1.width(context) / 2.4,
                                height: 160,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: const [
                                      Text(
                                        "Fertilization",
                                        style: TextStyle(
                                            color: Colors.white,
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
                              ),
                            )),
                      ),
                      const SizedBox(width: 8),
                      Align(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Pesticides.id);
                          },
                          child: Card(
                              elevation: 20,
                              color: HexColor('53B466'),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment(0, 1),
                                    // 10% of the width, so there are ten blinds.
                                    colors: <HexColor>[
                                      HexColor('56ab2f'),
                                      HexColor('a8e063'),
                                    ],
                                    // red to yellow
                                  ),
                                ),
                                child: SizedBox(
                                  // width: 160,
                                  width: e1.width(context) / 2.4,
                                  height: 160,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: const [
                                        Text(
                                          "Pesticides",
                                          style: TextStyle(
                                              color: Colors.white,
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
