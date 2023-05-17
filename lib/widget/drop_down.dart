import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  @override
  DropDownWidget createState() => DropDownWidget();
}

class DropDownWidget extends State {

  String dropdownValue = 'Osmanabad';

  List <String> spinnerItems = [
    'Osmanabad',
    'Latur',
    'Solapur',
    'Beed',
    'Pune',
    'Nagpur',
    'Thane',
    'Nanded',
    'Parbhani'
  ] ;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      style: Theme.of(context).textTheme.subtitle1,
      underline: Container(
        height: 0,
      ),
      onChanged: (data) {
        setState(() {
          dropdownValue = data ?? '';
        });
      },
      items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}