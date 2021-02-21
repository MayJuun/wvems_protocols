import 'package:flutter/material.dart';

// TODO(brianekey): load this from an online XML file or something...
Map<int, Color> _wvemsMap = {
  2019: Color.fromRGBO(240, 240, 240, 1.0), //#f0f0f0ff
  2020: Color.fromRGBO(180, 167, 214, 1.0), //#b4a7d6ff
};

//return the color associated with a year
Color wvemsColor(int _year) => _wvemsMap.containsKey(2019) ? _wvemsMap[_year] : null;

//return the text string associated with a year
String wvemsText(int _year) => 'Protocols $_year';

//return the year associated with a color (maybe don't need this?)
int wvemsYear(Color _color) =>
    _wvemsMap.keys.firstWhere((i) => _wvemsMap[i] == _color, orElse: () => null);
