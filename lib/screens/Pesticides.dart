import 'package:flutter/material.dart';

class Pesticides extends StatefulWidget {
  static const String id = 'Pesticides_screen';

  const Pesticides({Key? key}) : super(key: key);

  @override
  State<Pesticides> createState() => _PesticidesState();
}

class _PesticidesState extends State<Pesticides> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesticides'),
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
