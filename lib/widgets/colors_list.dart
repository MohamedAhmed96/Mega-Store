import 'package:flutter/material.dart';

class ColorsList with ChangeNotifier{
  List<Color> _colorsList = [
    Colors.black,
    Colors.grey.withOpacity(0.3),
    Colors.redAccent,
    Colors.grey.withOpacity(0.8),
    Colors.brown.withOpacity(0.5),
    Colors.blue.withOpacity(0.9),
  ];

  Color colorsList (int index){
    return [..._colorsList][index];
  }

  int get colorsListLength {
    return [..._colorsList].length;
  }
}
