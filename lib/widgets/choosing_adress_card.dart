import 'package:mega_store/provider/address_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/choosing_shipping_addresses_screen.dart';
import '../provider/address_provider.dart';

class ChoosingAddressCard extends StatefulWidget {
  final Address address;
  final int index;
  ChoosingAddressCard({@required this.address, @required this.index});
  @override
  _ChoosingAddressCardState createState() => _ChoosingAddressCardState();
}

class _ChoosingAddressCardState extends State<ChoosingAddressCard> {
  @override
  Widget build(BuildContext context) {
    final _address = Provider.of<AddressProvider>(context);
    return Container(
      height: 140,
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
                widget.address.name,
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
                      'Edit',
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
              widget.address.adress,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ),
          Text(
            '${widget.address.city}, ${widget.address.state} ${widget.address.zipCode}, ${widget.address.country}',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _address.choosenAddress(widget.index);
                    });
                  },
                  child: Icon(
                    widget.address.choosen
                        ? Icons.check_box
                        : Icons.check_box_outline_blank,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Use as the shipping address',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
