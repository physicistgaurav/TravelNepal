// import 'dart:html';
// import 'dart:async';
// import 'dart:html';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';

import 'package:matrix_link/pages/BottomNavigation.dart';

class DropDownflight extends StatefulWidget {
  DropDownflight() : super();

  final String title = "DropDown Demo";
  @override
  DropDownState createState() => DropDownState();
}

class Location {
  int id;
  String name;

  Location(this.id, this.name);

  static List<Location> getCompanies() {
    return <Location>[
      Location(0, ''),
      Location(1, 'Kathmandu'),
      Location(2, 'Pokhara'),
      Location(3, 'Biratnagar'),
      Location(4, 'Mustang'),
      Location(5, 'Lumbini'),
      Location(6, 'Surkhet'),
      Location(7, 'Birgunj'),
      Location(8, 'Bharatpur'),
      Location(9, 'Janakpur'),
      Location(10, 'Jomsom'),
      Location(11, 'Lukla'),
      Location(12, 'Taplejung'),
    ];
  }
}

class Flightclass {
  int id;
  String name;

  Flightclass(this.id, this.name);

  static List<Flightclass> getClass() {
    return <Flightclass>[
      // Flightclass(0, ''),
      Flightclass(1, 'Economy'),
      Flightclass(2, 'Business'),
      Flightclass(2, 'First CLass'),
    ];
  }
}

class DropDownState extends State<DropDownflight> {
  //
  List<Location> _location = Location.getCompanies();
  List<DropdownMenuItem<Location>> _dropdownMenuItems;
  // List<Flightclass> _flightclass = Flightclass.getClass();
  // List<DropdownMenuItem<Flightclass>> _dropdownMenuclassItems;
  Location _selectedorigin;
  Location _selecteddestination;
  // Flightclass _selectedclass;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_location);
    _selectedorigin = _dropdownMenuItems[0].value;
    _selecteddestination = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Location>> buildDropdownMenuItems(List location) {
    List<DropdownMenuItem<Location>> items = [];
    for (Location location in location) {
      items.add(
        DropdownMenuItem(
          value: location,
          child: Text(location.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItemorigin(Location selectedCompany) {
    setState(() {
      _selectedorigin = selectedCompany;
    });
  }

  onChangeDropdownItemdestination(Location selectedCompany) {
    setState(() {
      _selecteddestination = selectedCompany;
    });
  }

  DateTime date = DateTime.now();
  Future<Null> selectDatePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2021),
        lastDate: DateTime(2022));
    if (picked != null && picked != date) {
      setState(() {
        date = picked;
        print(date.toString());
      });
    }
  }

  var _dropdownValue;
  String _dropdownwayValue;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    // validator: (s){},
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        hintText: "Enter your name",
                        labelText: "Booking Name",
                        suffixIcon: Icon(Icons.person),
                        isDense: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),

                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.always,
                    keyboardType: TextInputType.number,
                    cursorWidth: 50,
                    maxLines: null,
                    maxLength: 10,
                    validator: (input) {
                      final isDigitOnly = int.tryParse(input);
                      return isDigitOnly == null ? 'Only Digits allowed' : null;
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(12),
                        hintText: "Enter your number",
                        labelText: "Contact-Number",
                        suffixIcon: Icon(
                          Icons.contact_phone_rounded,
                        ),
                        isDense: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text("Origin",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: DropdownButton(
                    value: _selectedorigin,
                    items: _dropdownMenuItems,
                    onChanged: onChangeDropdownItemorigin,
                    focusColor: Colors.red,
                    hint: Text(
                      "Location",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                // to show selected
                // Text('Selected: ${_selectedorigin.name}'),
                SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text("Destination",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: DropdownButton(
                    value: _selecteddestination,
                    items: _dropdownMenuItems,
                    onChanged: onChangeDropdownItemdestination,
                    focusColor: Colors.red,
                    hint: Text(
                      "Biratnagar",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.always,
                    keyboardType: TextInputType.number,
                    cursorWidth: 50,
                    maxLines: null,
                    maxLength: 2,
                    validator: (input) {
                      final isDigitOnly = int.tryParse(input);
                      return isDigitOnly == null ? 'Only Digits allowed' : null;
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(12),
                        hintText: "Total passenger",
                        labelText: "Number of Passengers",
                        suffixIcon: Icon(Icons.flight_takeoff_sharp),
                        isDense: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text("Flight Class",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: DropdownButton<String>(
                      value: _dropdownValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      items: <String>['', 'Economy', 'Business', 'First class']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: Text("Select Flight Class"),
                      onChanged: (String value) {
                        setState(() {
                          _dropdownValue = value;
                        });
                      }),
                ),

                SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text("Select Way",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: DropdownButton<String>(
                      value: _dropdownwayValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      items: <String>['', 'One-way', 'Two-way']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: Text("Select way"),
                      onChanged: (String value) {
                        setState(() {
                          _dropdownwayValue = value;
                        });
                      }),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      FlatButton(
                        child: Text("Booking Date"),
                        color: Colors.blue,
                        textColor: Colors.white,
                        onPressed: () {
                          selectDatePicker(context);
                        },
                      ),
                      Text(date.toString())
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Color.fromRGBO(255, 0, 0, 0.7),
                          primary: Colors.white,
                          onSurface: Colors.red,
                          minimumSize: Size(88, 36),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2.0)))),
                      onPressed: () {},
                      child: Text(
                        "Book Now",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
