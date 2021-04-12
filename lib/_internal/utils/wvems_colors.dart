import 'package:flutter/material.dart';

// TODO(brianekey): maybe load this from an online XML file or something...
// In general, all app colors should be near black or near white, with just
// one accent color that is linked to the year being displayed. The year
// accent color will be chosen to maintain a 7+ to 1 contrast with near
// black (#0F0F0F)

Map<int, Color> _wvemsMap = {
  2019: const Color.fromRGBO(240, 240, 240, 1.0), //#f0f0f0
  2020: const Color.fromRGBO(180, 167, 214, 1.0), //#b4a7d6
  2021: const Color.fromRGBO(255, 242, 204, 1.0), //#fff2cc
};

//return the color associated with a year
Color wvemsColor(int _year) =>
    _wvemsMap[_year] ?? const Color.fromRGBO(255, 242, 204, 1.0);

//return the text string associated with a year
String wvemsText(int _year) => 'Protocols $_year';

//return the year associated with a color (maybe don't need this?)
int wvemsYear(Color _color) => _wvemsMap.keys
    .firstWhere((i) => _wvemsMap[i] == _color, orElse: () => 1900);
