import 'package:flutter/material.dart';

import '../screens/payment_methods_screen.dart';

class PaymentCard extends StatefulWidget {
  @override
  _PaymentCardState createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  Text _visaNumberDecryption(int number) {
    var _len = number.toString().length;
    Text _text;
    switch (_len) {
      case 13:
        _text = Text('*** *** *** ${number.toString().substring(9)}');
        break;
      case 14:
        _text = Text('*** *** *** ${number.toString().substring(12)}');
        break;
      case 15:
        _text = Text('*** *** *** ${number.toString().substring(12)}');
        break;
      case 16:
        _text = Text('*** *** *** ${number.toString().substring(12)}');
        break;
    }
    return _text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Payment',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(PaymentMethodsScreen.routeName);
                  },
                  child: Container(
                    height: 30,
                    padding: const EdgeInsets.only(
                      right: 15,
                    ),
                    child: Center(
                      child: Text(
                        'Change',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Row(
              children: <Widget>[
                Container(
                  height: 50,
                  width: 80,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  margin: const EdgeInsets.only(
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: Image.asset(
                    'lib/assets/images/masterCardLogo.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  child: _visaNumberDecryption(1234567893947),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
