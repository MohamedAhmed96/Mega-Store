import 'package:flutter/cupertino.dart';

import './products_provider.dart';

class Bag {
  final List<Product> bagProducts;
  Bag({@required this.bagProducts});
}

class BagProvider with ChangeNotifier {
  //final
}
