import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';

import '../provider/address_provider.dart';

class AddingShippingAddressScreen extends StatefulWidget {
  static String routeName = '/addingShippingAddressScr';
  @override
  _AddingShippingAddressScreenState createState() =>
      _AddingShippingAddressScreenState();
}

class _AddingShippingAddressScreenState
    extends State<AddingShippingAddressScreen> {
  var address = Address(
      name: '',
      adress: '',
      city: '',
      state: '',
      zipCode: '',
      country: '',
      choosen: false);
  List<String> _formHintTexts = [
    'Full name',
    'Address',
    'City',
    'State/Province/Region',
    'Zip Code (Postal Code)',
    'Country',
  ];

  List<String> _errorTexts = [
    'Please enter some text',
    'Please enter a valid address',
    'Please enter a city',
    'Please enter State/Province/Region',
    'Please enter a valid Zip Code (Postal Code)',
    'Please enter Country',
  ];

  bool _validator(int index, String value) {
    bool valid;
    switch (index) {
      case 0:
        valid = (value == 'Mohamed');
        //print(valid);
        break;
      case 1:
        valid = (value.isNotEmpty &&
            !isNumeric(
              value.toString(),
            ));
        //print(valid);
        break;
      case 2:
        valid = value.isNotEmpty;
        //print(valid);
        break;
      case 3:
        valid = value.isNotEmpty;
        //print(valid);
        break;
      case 4:
        valid = (value.isNotEmpty && !isAlpha(value));
        //print(valid);
        break;
      case 5:
        valid = (!isNumeric(
              value.toString(),
            ) &&
            value.isNotEmpty);
        //print(valid);
        break;
    }
    return valid;
  }

  List<dynamic> _address = ['', '', '', '', '', '', false];

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final _shippingAddresses = Provider.of<AddressProvider>(context);
    AppBar appBar = AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Icon(
          CupertinoIcons.back,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      title: Text(
        'Adding Shipping Address',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          //color: Colors.green,
          height: (MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top),
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 20,
          ),
          child: Form(
            key: _formKey,
            child: Container(
              height: (MediaQuery.of(context).size.height -
                  appBar.preferredSize.height -
                  MediaQuery.of(context).padding.top),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemCount: _formHintTexts.length,
                      itemBuilder: (ctx, index) {
                        return Container(
                          height: 70,
                          margin: const EdgeInsets.only(
                            bottom: 15,
                          ),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.04),
                                blurRadius: 1,
                              ),
                            ],
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (_validator(index, value)) {
                                _address[index] = value.toString();
                                return null;
                              } else {
                                return _errorTexts[index];
                              }
                              //_validator(index, value) ? null : _errorTexts[index];
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: _formHintTexts[index],
                              //labelText: ,
                              labelStyle: TextStyle(
                                color: Colors.black26,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Builder(
                    builder: (context) => GestureDetector(
                      onTap: () {
                        if (_formKey.currentState.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.

                          address.name = _address[0];
                          address.adress = _address[1];
                          address.city = _address[2];
                          address.state = _address[3];
                          address.zipCode = _address[4];
                          address.country = _address[5];
                          address.choosen = _address[6];
                          _shippingAddresses.addAddress(address);
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Processing Data'),
                            ),
                          );
                          Navigator.of(context).pop();
                        }
                      },
                      child: Container(
                        height: 50,
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.red,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'SAVE ADDRESS',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
