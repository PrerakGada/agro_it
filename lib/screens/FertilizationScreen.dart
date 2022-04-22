import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FertilizationScreen extends StatefulWidget {
  static const String id = 'Fertilizer_screen';
  const FertilizationScreen({Key? key}) : super(key: key);

  @override
  State<FertilizationScreen> createState() => _FertilizationScreenState();
}

class _FertilizationScreenState extends State<FertilizationScreen> {

  String dropdownvalue = 'Rice';

  // List of items in our dropdown menu
  var items = [
    'Rice',
    'Olive',
    'Vine',
    'For extensive crops',
    'Reductal plus',
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          leading: IconButton(icon: Icon(Icons.arrow_back,), onPressed: () { Navigator.pop(context); },),
          title: Text("Fetilizer Suggestion "),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 50),
              Center(
                child: Text("Which Fertilizer should I use?",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Select Crop",
                      style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
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
                  ),
                ],
              ),
              Center(
                child: ElevatedButton(
                    child: Text('Get Fertilizer'),
                    onPressed: ()  {

                    },
                    style: ElevatedButton.styleFrom(
                      // background color
                        primary: Colors.green,
                        padding: EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ))),
              ),
              SizedBox(height: 10),
              Center(
                  child: dropdownvalue=='Rice'
                      ?Column(
                    children: [
                      DataTable(
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Text(
                              'Nutrients',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Composition',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ],
                        rows: const <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Free Amino acids')),
                              DataCell(Text('10.00% w/w = 12.20% w/v')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Total Nitrogen (N)')),
                              DataCell(Text('3.00%w/w = 3.66% w/v')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Organic Nitrogen')),
                              DataCell(Text('3.00%w/w = 3.66% w/v')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Boron (B) water-soluble')),
                              DataCell(Text('1.00% w/w = 1.22% w/v')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Molybdenum (Mo) water-soluble')),
                              DataCell(Text('1.00% w/w = 1.22% w/v')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Zinc (Zn) water-soluble')),
                              DataCell(Text('0.50% w/w = 0.61% w/v')),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Best Fertilizer Company : Coromandel International Ltd.",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ) : dropdownvalue == 'Olive' ? Column(
                    children: [
                      DataTable(
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Text(
                              'Nutrients',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Composition',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ],
                        rows: const <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Total Nitrogen (N)')),
                              DataCell(Text('15.00% w/w = 19.50% w/v')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Nitric Nitrogen')),
                              DataCell(Text('2.50% w/w = 3.25% w/v')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Magnesium (MgO) water-soluble')),
                              DataCell(Text('3.50% w/w = 4.55% w/v')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Iron (Fe) water-soluble')),
                              DataCell(Text('1.00% w/w = 1.30% w/v')),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Best Fertilizer Company : National Fertilizers Ltd.",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ) : dropdownvalue == 'Vine' ? Column(
                    children: [
                      DataTable(
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Text(
                              'Nutrients',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Composition',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ],
                        rows: const <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Free Amino acids')),
                              DataCell(Text('5.00% w/w = 6.20% w/v')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Total Nitrogen (N)')),
                              DataCell(Text('1.60% w/w = 1.98% w/v')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Organic Nitrogen')),
                              DataCell(Text('0.80% w/w = 0.99% w/v')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Iron (Fe) water-soluble')),
                              DataCell(Text('3.00% w/w = 3.72% w/v')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Molybdenum (Mo) water-soluble')),
                              DataCell(Text('1.00% w/w = 1.22% w/v')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Zinc (Zn) water-soluble')),
                              DataCell(Text('0.50% w/w = 0.61% w/v')),
                            ],
                          ),
                        ],
                      ),
                      Text("Best Fertilizer Company : Chambal Fertilizers & Chemicals Ltd.",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ) : dropdownvalue == 'For extensive crops' ? Column(
                    children: [
                      DataTable(
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Text(
                              'Nutrients',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Composition',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ],
                        rows: const <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Free Amino acids')),
                              DataCell(Text('10.00% w/w = 11.90% w/v')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Total Nitrogen (N)')),
                              DataCell(Text('1.50% w/w = 1.78% w/v')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Organic Nitrogen')),
                              DataCell(Text('1.40% p/p = 1.67% p/v')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Boron (B) water-soluble')),
                              DataCell(Text('0.05% w/w = 0.06% w/v')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Cobalt (Co) water-soluble')),
                              DataCell(Text('0.05% w/w = 0.06% w/v')),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Best Fertilizer Company : Rashtriya Chemicals & Fertilizers Ltd.",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ): dropdownvalue == 'Reductal plus' ? Column(
                    children: [
                      DataTable(
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Text(
                              'Nutrients',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Composition',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ],
                        rows: const <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Total Nitrogen (N)')),
                              DataCell(Text('3.00% w/w = 3.45% w/v')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Ureic Nitrogen')),
                              DataCell(Text('3.00% w/w = 3.45% w/v')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Phosphorus (P2O5)')),
                              DataCell(Text('15.00% p/p = 17.25% p/v')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Boron (B) water-soluble')),
                              DataCell(Text('1.00% w/w = 1.22% w/v')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Molybdenum (Mo) water-soluble')),
                              DataCell(Text('1.00% w/w = 1.22% w/v')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Zinc (Zn) water-soluble')),
                              DataCell(Text('0.50% w/w = 0.61% w/v')),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Best Fertilizer Company : Zuari Agro Chemicals Ltd.",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ) : Column(
                    children: [
                      DataTable(
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Text(
                              'Nutrients',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Composition',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ],
                        rows: const <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Free Amino acids')),
                              DataCell(Text('10.00% w/w = 12.20% w/v')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Total Nitrogen (N)')),
                              DataCell(Text('3.00%w/w = 3.66% w/v')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Organic Nitrogen')),
                              DataCell(Text('3.00%w/w = 3.66% w/v')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Boron (B) water-soluble')),
                              DataCell(Text('1.00% w/w = 1.22% w/v')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Molybdenum (Mo) water-soluble')),
                              DataCell(Text('1.00% w/w = 1.22% w/v')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Zinc (Zn) water-soluble')),
                              DataCell(Text('0.50% w/w = 0.61% w/v')),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Best Fertilixer Company : Gujarat Narmada Valley Fertilizers & Chemicals Ltd.",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
