import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/nav_bar_wid_tab.dart';
import '../provider/products_provider.dart';

import '../screens/categories_screen.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).products;
    final current = Provider.of<NavBarWidTab>(context);
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(
                  'lib/assets/images/mainPage.png',
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.35,
                  left: 12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Fashion \nsale',
                        style: TextStyle(
                            fontFamily: 'Metropolis',
                            fontSize: 48,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.43,
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(25)),
                        child: GestureDetector(
                          onTap: () {
                            current.goTo(CategoriesScreen(), 1);
                          },
                          child: Center(
                            child: Text(
                              'Check',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              //i'll remove this container widget!!
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0, left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'New',
                              style: TextStyle(
                                  fontFamily: 'Metropolis',
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'You \'ve never seen it before!',
                              style: TextStyle(
                                fontFamily: 'Metropolis',
                                fontSize: 13,
                                //color: Color(0x9B9B9B),
                                color: Colors.grey.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Text(
                            'View all',
                            style: TextStyle(
                              fontFamily: 'Metropolis',
                              fontSize: 11,
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductCard(
                            product: products[index],
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
      ),
    );
  }
}
