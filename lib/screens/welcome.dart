import 'package:agro_it/screens/SignUpScreen.dart';
import 'package:flutter/material.dart';

import 'LoginScreen.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const String id = 'Login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
            decoration:const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/farmer.jpg"),
                    fit: BoxFit.cover)),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Column(
                    children: [
                      Container(height: 30,),
                      /*const Text("Welcome to KesanSeva",
                          style: TextStyle(fontSize: 50)),*/

                      Container(
                        height: 550,
                      ),
                      Center(
                        child: ElevatedButton(

                          style: ElevatedButton.styleFrom(shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.only(topRight: Radius.circular(30.0),bottomLeft: Radius.circular(30.0)),
                          ),
                            primary: Colors.green,
                            fixedSize: const Size(200 ,50),
                            // shape: const StadiumBorder(),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 20,
                                color: Colors.white
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context,LoginScreen.id);
                          },
                        ),
                      ),
                      Container(
                        height: 30,
                      ),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.only(topRight: Radius.circular(30.0),bottomLeft: Radius.circular(30.0)),
                          ),
                            primary: Colors.green,
                            fixedSize: const Size(200 ,50),
                          ),
                          child: const Text('Sign-up',
                              style: TextStyle(fontSize: 20,
                                  color: Colors.white
                              )),
                          onPressed: () {
                            Navigator.pushNamed(context,SignUpScreen.id);
                          },
                        ),
                      ),
                    ],
                  ),
                ])),
          )),
    );
  }
}