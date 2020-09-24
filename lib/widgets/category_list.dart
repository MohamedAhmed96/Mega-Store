import 'package:flutter/material.dart';

class CategoryList with ChangeNotifier{
  List<String> _categoryList = [
    'All','Women','Men','Boys','Girls'
  ];

  String categoryList (int index){
    return [..._categoryList][index];
  }

  int get categoryListLength {
    return [..._categoryList].length;
  }
}
