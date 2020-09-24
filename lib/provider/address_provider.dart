import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

class Address {
  String name;
  String adress;
  String city;
  String state;
  String zipCode;
  String country;
  bool choosen;

  Address({
    @required this.name,
    @required this.adress,
    @required this.city,
    @required this.state,
    @required this.zipCode,
    @required this.country,
    @required this.choosen,
  });
}

class AddressProvider with ChangeNotifier {
  List<Address> shippingAddresses = [
    Address(
      name: 'Mohamed',
      adress: '3 Newbridge Court',
      city: 'Chino Hills',
      state: 'California',
      zipCode: '91709',
      country: 'United States',
      choosen: true,
    ),
    Address(
      name: 'Hossam',
      adress: '3 Newbridge Court',
      city: 'Chino Hills',
      state: 'California',
      zipCode: '91709',
      country: 'United States',
      choosen: false,
    ),
    Address(
      name: 'Shady',
      adress: '3 Newbridge Court',
      city: 'Chino Hills',
      state: 'California',
      zipCode: '91709',
      country: 'United States',
      choosen: false,
    ),
  ];
  //List<
  void choosenAddress(int index) {
    for (int i = 0; i < shippingAddresses.length; i++) {
      i == index
          ? shippingAddresses[i].choosen = true
          : shippingAddresses[i].choosen = false;
    }
    notifyListeners();
  }

  Address choosenAddressCard() {
    return shippingAddresses.firstWhere((element) => element.choosen);
  }

  void addAddress(Address address) {
    shippingAddresses.add(address);
  }
}
