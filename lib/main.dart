

import 'package:flutter/material.dart';

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
      initialRoute: Loading.id,
      routes: {
        Loading.id: (context) => Loading(),
        LoginScreen1.id: (context) => LoginScreen1(),
        LoginScreen.id: (context) => LoginScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        DashBoard.id: (context) => DashBoard(),
        //Humidity.id: (context) => Humidity(),
        WaterIrrigation.id: (context) => WaterIrrigation(),
        ScheduleP.id: (context) => ScheduleP(),
        ScheduleP.id: (context) => ScheduleP(),
        FetilizerSuggestion.id: (context) => FetilizerSuggestion(),
      },
    );
  }
}
