import '../provider/address_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/choosing_shipping_addresses_screen.dart';

class AddressCard extends StatefulWidget {
  @override
  _AddressCardState createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  @override
  Widget build(BuildContext context) {
    final _address = Provider.of<AddressProvider>(context).choosenAddressCard();
    return Container(
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.only(
        top: 20,
        bottom: 5,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                _address.name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(ChoosingShippingAddressesScreen.routeName);
                },
                child: Container(
                  height: 30,
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
          Padding(
            padding: const EdgeInsets.only(bottom: 5, top: 5),
            child: Text(
              _address.adress,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ),
          Text(
            '${_address.city}, ${_address.state} ${_address.zipCode}, ${_address.country}',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
