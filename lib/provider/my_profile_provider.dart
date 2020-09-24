import 'package:flutter/material.dart';

class MyProfileProvider with ChangeNotifier {
  Map<String, dynamic> _profileConntent = {
    'My orders' : 'Already have 12 orders',
    'Shipping addresses' : '3 addresses',
    'Payment methods' : 'Visa **34',
    'Promocodes' : 'You have social promocodes',
    'My reviews' : 'Reviews for 4 items',
    'Settings' : 'Notifications, password',
  };

  String title (int index){
    return [..._profileConntent.keys][index];
  }

  String subTitle (int index){
    return [..._profileConntent.values][index];
  }

  int get length {
    return [..._profileConntent.keys].length;
  }
}