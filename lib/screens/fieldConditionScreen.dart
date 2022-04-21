import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../modules/details.dart';

class FieldConditionScreen extends StatefulWidget {
  static const String id = 'fieldCondition_screen';

  const FieldConditionScreen({Key? key}) : super(key: key);

  @override
  State<FieldConditionScreen> createState() => _FieldConditionScreenState();
}

class _FieldConditionScreenState extends State<FieldConditionScreen> {
  Extradetails e1 = Extradetails();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Field Condition'),
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
                    width: e1.width(context) / 1.2,
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
                            " Temperature:   ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "31 C",
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
                    width: e1.width(context) / 1.2,
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
                            " Humidity:   ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "71%",
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
