import '../widgets/delivery_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../widgets/address_card.dart';
import '../widgets/payment_card.dart';
import '../provider/products_provider.dart';

class OrderCheckOutScreen extends StatefulWidget {
  static String routeName = '/orderCheckOutScr';
  @override
  _OrderCheckOutScreenState createState() => _OrderCheckOutScreenState();
}

class _OrderCheckOutScreenState extends State<OrderCheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    Map<Text, Text> _orderDetails = {
      Text(
        'Order',
        style: TextStyle(
          color: Colors.grey.withOpacity(0.5),
          fontSize: 16,
        ),
      ): Text(
        '${Provider.of<Products>(context).bagTotalCost} \$',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        'Delivery',
        style: TextStyle(
          color: Colors.grey.withOpacity(0.5),
          fontSize: 16,
        ),
      ): Text(
        '10 \$',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        'summary',
        style: TextStyle(
          color: Colors.grey.withOpacity(0.5),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ): Text(
        '${Provider.of<Products>(context).bagTotalCost + 10} \$',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    };
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
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
          'Checkout',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        //color: Colors.red,
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Shipping address',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            AddressCard(),
            PaymentCard(),
            DeliveryMethod(),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemCount: _orderDetails.length,
                      itemBuilder: (ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              _orderDetails.keys.toList()[index],
                              _orderDetails.values.toList()[index],
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  'SUBMIT ORDER',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
