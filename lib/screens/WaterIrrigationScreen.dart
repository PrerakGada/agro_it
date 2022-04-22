import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class WaterIrrigationScreen extends StatefulWidget {
  static const String id = 'Water_screen';

  const WaterIrrigationScreen({Key? key}) : super(key: key);

  @override
  State<WaterIrrigationScreen> createState() => _WaterIrrigationScreenState();
}

class _WaterIrrigationScreenState extends State<WaterIrrigationScreen> {
  // Extradetails e1 = Extradetails();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Water Irrigation'),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
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
                    // width: e1.width(context) / 1.2,
                    // width: 160,
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Image(
                            image: AssetImage('assets/1.png'),
                            height: 50,
                          ),
                          Text(
                            "Irrigation Status : ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "True",//false
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
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
                    // width: e1.width(context) / 1.2,
                    // width: 160,
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          // Image(
                          //   image: AssetImage('assets/1.png'),
                          //   height: 50,
                          // ),
                          Text(
                            "Water Dispenser : ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Activated",//Deactivated,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
