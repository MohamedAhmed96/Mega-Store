import 'package:flutter/material.dart';

class SizesList with ChangeNotifier{
  List<String> _sizesList = [
    'S','M','L','XL','XS'
  ];

  String sizesList (int index){
    return [..._sizesList][index];
  }

  int get sizesListLength {
    return [..._sizesList].length;
  }
}
