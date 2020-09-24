import './adding_shipping_address_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/choosing_adress_card.dart';
import '../provider/address_provider.dart';

class ChoosingShippingAddressesScreen extends StatefulWidget {
  static String routeName = '/choosingShippingAddressesScr';
  @override
  _ChoosingShippingAddressesScreenState createState() =>
      _ChoosingShippingAddressesScreenState();
}

class _ChoosingShippingAddressesScreenState
    extends State<ChoosingShippingAddressesScreen> {
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
        'Shipping Addresses',
        style: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top -
                      appBar.preferredSize.height) *
                  0.98,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              margin: EdgeInsets.symmetric(
                  vertical: (MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top -
                          appBar.preferredSize.height) *
                      0.01),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemCount: _shippingAddresses.shippingAddresses.length,
                      itemBuilder: (ctx, index) {
                        return ChoosingAddressCard(
                          address: _shippingAddresses.shippingAddresses[index],
                          index: index,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(AddingShippingAddressScreen.routeName);
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
