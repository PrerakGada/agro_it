import 'package:agro_it/screens/FertilizationScreen.dart';
import 'package:agro_it/screens/Pesticides.dart';
import 'package:agro_it/screens/ProfileScreen.dart';
import 'package:agro_it/screens/WaterIrrigationScreen.dart';
import 'package:agro_it/screens/fieldConditionScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screens/Loading.dart';
import 'screens/LoginScreen.dart';
import 'screens/SignUpScreen.dart';
import 'screens/welcome.dart';
import 'screens/dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.id,
      routes: {
        Loading.id: (context) => Loading(),
        LoginScreen.id: (context) => LoginScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        DashBoard.id: (context) => DashBoard(),
        SignUpScreen.id: (context) => SignUpScreen(),
        FieldConditionScreen.id: (context) => FieldConditionScreen(),
        WaterIrrigationScreen.id: (context) => WaterIrrigationScreen(),
        FertilizationScreen.id: (context) => FertilizationScreen(),
        Pesticides.id: (context) => Pesticides(),
        ProfileScreen.id: (context) => ProfileScreen(),
      },
    );
  }
}
