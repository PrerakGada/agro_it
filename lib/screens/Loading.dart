import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import '../modules/details.dart';
import 'LoginScreen.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);
  static const String id = 'Loading';

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  Extradetails e1=Extradetails();
  @override
  void initState()
  {
    super.initState();
    startTime();
  }

  startTime()
  {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    int? log = sharedPreferences.getInt('Login_status') ?? 0;
    Navigator.pushReplacementNamed(context,LoginScreen.id);
    // log == 0 ?
    // Navigator.pushReplacementNamed(context,LoginScreen1.id) :
    // Navigator.pushReplacementNamed(context,DashBoard.id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage(
                    'assets/images/Logo.jpeg',
                ),
                height: 80,
              ),
              Container(height:20),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Agro",style: GoogleFonts.sigmarOne(color: e1.secondarycolor(),fontSize: 60), ),
                        Text("IT",style: GoogleFonts.sigmarOne(color: e1.primarycolor(),fontSize:40), ),
                      ],
                    ),
                    Text("A helping hand to Farmers"),
                  ],
                ),
              ),
              SizedBox(height: 150),
              SpinKitFadingCube(
                color: HexColor('#FFA451'),
              ),
              Container(height: 10,),


            ],
          ),
        )

    );
  }
}