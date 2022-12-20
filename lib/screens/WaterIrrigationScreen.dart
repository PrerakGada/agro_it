import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class WaterIrrigationScreen extends StatefulWidget {
  static const String id = 'Water_screen';

  const WaterIrrigationScreen({Key? key}) : super(key: key);

  @override
  State<WaterIrrigationScreen> createState() => _WaterIrrigationScreenState();
}

class _WaterIrrigationScreenState extends State<WaterIrrigationScreen> {
  DateTime? fromDate;
  TextEditingController fromDateInput = TextEditingController();
  String dropdownvalue = '10 L';
  TimeOfDay selectedTime = TimeOfDay.now();

  // List of items in our dropdown menu
  var items = [
    '10 L',
    '20 L',
    '30 L',
    '35 L',
    '40 L',
    '45 L',

  ];

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
                            "True", //false
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
                            "Activated", //Deactivated,
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
            Container(
              /*decoration:const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/s.jpg"),
                  fit: BoxFit.cover)),*/
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          "Select Water Quantity",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w300),
                        ),
                        SizedBox(width: 10),
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
                    SizedBox(height: 10),
                    Text(
                      "Set the Date and Time",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Text(
                                  "Date",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.transparent),
                                ),
                                Text(
                                  "Date",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )),
                        Expanded(
                          flex: 4,
                          child: TextField(
                            controller: fromDateInput,
                            //editing controller of this TextField
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.calendar_today,
                                color: Colors.green,
                              ),
                              //icon of text field
                              labelText: "Enter Date", //label text of field
                            ),
                            readOnly: true,
                            //set it true, so that user will not able to edit text
                            onTap: () async {
                              DateTime? pickedFormDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2101));

                              if (pickedFormDate != null) {
                                print(
                                    pickedFormDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate =
                                    DateFormat('E, MMM d,' 'y')
                                        .format(pickedFormDate);
                                print(
                                    formattedDate); //formatted date output using intl package =>  2021-03-16
                                //you can implement different kind of Date Format here according to your requirement

                                setState(() {
                                  fromDateInput.text = formattedDate;
                                  fromDate =
                                      pickedFormDate; //set output date to TextField value.
                                });
                              } else {
                                print("Date is not selected");
                              }
                            },
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: Text(
                              "Shubh",
                              style: TextStyle(color: Colors.transparent),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            _selectTime(context);
                          },
                          child: Text(
                            "Choose Time",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.black),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              _selectTime(context);
                            },
                            icon: Icon(
                              Icons.timer,
                              color: Colors.green,
                            )),
                        Text(
                          "${selectedTime.hour}:${selectedTime.minute}",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: ElevatedButton(
                        child: Text('Schedule'),
                        onPressed: () {
                          Navigator.pop(context);
                          Fluttertoast.showToast(
                            msg: "Scheduled Successfully",
                            toastLength: Toast.LENGTH_SHORT,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          // background color
                          primary: Colors.green,
                          padding: EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(
        () {
          selectedTime = timeOfDay;
        },
      );
    }
  }
}
