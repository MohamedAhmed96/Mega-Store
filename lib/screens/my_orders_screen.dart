import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

//import '../provider/my_profile_provider.dart';
import './my_profile_screen.dart';
import '../provider/nav_bar_wid_tab.dart';
import '../widgets/order_card.dart';

class MyOrdersScreen extends StatefulWidget {
  static String routeName = '/myOrdersScreen';
  @override
  _MyOrdersScreenState createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  Map<String, dynamic> _orderStatus = {
    'Delivered': [
      OrderCard(),
      OrderCard(),
      OrderCard(),
    ],
    'Processing': [
      OrderCard(),
      OrderCard(),
      OrderCard(),
    ],
    'Cancelled': [
      OrderCard(),
      OrderCard(),
      OrderCard(),
    ]
  };
  var _pressed = 0;
  @override
  Widget build(BuildContext context) {
    final current = Provider.of<NavBarWidTab>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
        leading: GestureDetector(
          onTap: () {
            current.goTo(MyProfileScreen(), 4);
          },
          child: Icon(
            CupertinoIcons.back,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'My Orders',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Container(
              height: 40,
              margin: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _orderStatus.length,
                      itemBuilder: (ctx, index) {
                        return _pressed == index
                            ? Container(
                                height: 25,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 15,
                                ),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  _orderStatus.keys.toList()[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _pressed = index;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 15,
                                  ),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  height: 25,
                                  child: Text(
                                    _orderStatus.keys.toList()[index],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: _orderStatus.values.toList()[_pressed]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
