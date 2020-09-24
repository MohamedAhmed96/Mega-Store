import 'package:flutter/material.dart';

class DeliveryMethod extends StatefulWidget {
  @override
  _DeliveryMethodState createState() => _DeliveryMethodState();
}

class _DeliveryMethodState extends State<DeliveryMethod> {
  @override
  Widget build(BuildContext context) {
    Map<Image, Text> _deliveryLogos = {
      Image.asset(
        'lib/assets/images/fedexLogo.png',
        fit: BoxFit.fitWidth,
      ): Text(
        '2-3 days',
        style: TextStyle(
          color: Colors.grey.withOpacity(0.5),
          fontSize: 14,
        ),
      ),
      Image.asset(
        'lib/assets/images/uspsLogo.png',
        fit: BoxFit.fitWidth,
      ): Text(
        '2-3 days',
        style: TextStyle(
          color: Colors.grey.withOpacity(0.5),
          fontSize: 14,
        ),
      ),
      Image.asset(
        'lib/assets/images/dhlLogo.png',
        fit: BoxFit.fitWidth,
      ): Text(
        '2-3 days',
        style: TextStyle(
          color: Colors.grey.withOpacity(0.5),
          fontSize: 14,
        ),
      ),
    };
    return Container(
      height: 150,
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
                  'Delivery method',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 80,
            width: double.infinity,
            margin: const EdgeInsets.only(
              top: 20,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _deliveryLogos.length,
                    itemBuilder: (ctx, index) {
                      return Container(
                        height: 80,
                        width: 100,
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            _deliveryLogos.keys.toList()[index],
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                              ),
                              child: _deliveryLogos.values.toList()[index],
                            ),
                          ],
                        ),
                      );
                    },
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
