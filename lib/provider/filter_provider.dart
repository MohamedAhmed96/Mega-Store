import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './products_provider.dart';

class Filter with ChangeNotifier {
  Products products;
  Filter(this.products);
  List<Color> _choosedColors = [];
  List<String> _choosedSizes = [];
  List<String> _choosedCategories = [];
  var _rangeValues = RangeValues(0, 55);
}
