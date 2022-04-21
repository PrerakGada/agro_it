import 'package:agro_it/screens/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
late String emailid;

class SignUpScreen extends StatefulWidget {
  static const String id = 'signup_screen';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth = FirebaseAuth.instance;
  late String emailid;
  late String password;
  late String name;
  late String phone;

  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // final formKey = GlobalKey<FormState>();

  // final TextEditingController email = TextEditingController();
  // final TextEditingController age = TextEditingController();
  // final TextEditingController gender = TextEditingController();
  // final TextEditingController address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String dropdownvalue = 'Male';

    // List of items in our dropdown menu
    var items = [
      'Male',
      'Female',
      'Other',
    ];
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
        title: 'SignUp',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
          // key: _scaffoldKey,
            appBar: AppBar(
              title: const Text('SignUp'),
            ),
            backgroundColor: const Color(0xFFffffff),
            body: Center(
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Form(
                  // key: formKey, //key for form
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),
                        const Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const TextField(
                          enableInteractiveSelection: false,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                              borderRadius: BorderRadius.only(topRight: Radius.circular(30.0),bottomLeft: Radius.circular(30.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                              borderRadius: BorderRadius.only(topRight: Radius.circular(30.0),bottomLeft: Radius.circular(30.0)),
                            ),
                            hintText: 'Full Name',
                          ),
                        ),
                        const SizedBox(height: 25),
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            emailid = value;
                          },
                          enableInteractiveSelection: false,
                          decoration:
                          //InputDecoration(labelText: "Enter your Number"),
                          const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                              borderRadius: BorderRadius.only(topRight: Radius.circular(30.0),bottomLeft: Radius.circular(30.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                              borderRadius: BorderRadius.only(topRight: Radius.circular(30.0),bottomLeft: Radius.circular(30.0)),
                            ),
                            hintText: 'Email Address',
                          ),
                          //maxLength: 25,
                        ),
                        const SizedBox(height: 25),
                        TextFormField(
                          enableInteractiveSelection: false,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                              borderRadius: BorderRadius.only(topRight: Radius.circular(30.0),bottomLeft: Radius.circular(30.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                              borderRadius: BorderRadius.only(topRight: Radius.circular(30.0),bottomLeft: Radius.circular(30.0)),
                            ),
                            hintText: 'Phone Number',
                          ),
                        ),
                        // const SizedBox(
                        //   height: 40,
                        // ),
                        const SizedBox(height: 25),
                        TextFormField(
                          enableInteractiveSelection: false,
                          obscureText: true,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            password = value;
                          },
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                              borderRadius: BorderRadius.only(topRight: Radius.circular(30.0),bottomLeft: Radius.circular(30.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                              borderRadius: BorderRadius.only(topRight: Radius.circular(30.0),bottomLeft: Radius.circular(30.0)),
                            ),
                            hintText: 'Password',
                          ),
                        ),
                        /*Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              const Text("Select Your Gender",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),
                              ),
                              const SizedBox(width: 10),
                              DropdownButton(
                                // Initial Value
                                value: dropdownvalue,
                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),

                                // Array list of items
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownvalue = newValue!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),*/
                        const SizedBox(height: 25),

                        ElevatedButton(
                            child: const Text('Sign up'),
                            onPressed: () async {
                              try {
                                print(emailid);
                                print(password);
                                final newUser =
                                await _auth.createUserWithEmailAndPassword(
                                    email: emailid, password: password);
                                if (newUser != null) {
                                  Navigator.pushNamed(context, LoginScreen.id);
                                }
                              } catch (e) {
                                print(e);
                              }
                            },
                            style: ElevatedButton.styleFrom(shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.only(topRight: Radius.circular(30.0),bottomLeft: Radius.circular(30.0)),
                            ),
                              // background color
                                primary: Colors.green,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 50,
                                  vertical: 15,
                                ))),
                        // _user == null
                        //     ? Container()
                        //     : Text("The otp ${_user!.otp.toString()}"),
                      ],
                    ),
                  ),
                ),
              ),
            )));
    ;
  }
}
