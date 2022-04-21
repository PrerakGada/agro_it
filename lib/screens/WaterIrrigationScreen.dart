import 'package:flutter/material.dart';

class WaterIrrigationScreen extends StatefulWidget {
  static const String id = 'Water_screen';

  const WaterIrrigationScreen({Key? key}) : super(key: key);

  @override
  State<WaterIrrigationScreen> createState() => _WaterIrrigationScreenState();
}

class _WaterIrrigationScreenState extends State<WaterIrrigationScreen> {
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
    );
  }
}
