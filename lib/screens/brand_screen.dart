import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import './filters_screen.dart';

import '../provider/products_provider.dart';

class BrandScreen extends StatefulWidget {
  static String routeName = '/brand';
  @override
  _BrandScreenState createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandScreen> {
  var _brand = [
    'adidas',
    'adidas Originals',
    'Blend',
    'Boutique Moschino',
    'Champion',
    'Diesel',
    'Jack & Jones',
    'Naf Naf',
    'Red valentino',
    's.Oliver',
  ];
  var _checked = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List<String> _choosedBrands = [];
  @override
  Widget build(BuildContext context) {
    final brand = Provider.of<Products>(context).brands;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Filters',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          },
          child: Icon(
            CupertinoIcons.back,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          //color: Colors.white.withOpacity(0.1),
          height: 675,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Container(
                height: 45,
                width: 350,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 1,
                      ),
                    ]),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: GestureDetector(
                        child: Icon(
                          CupertinoIcons.search,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Search',
                          border: InputBorder.none,
                          labelStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: brand.length,
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            if (_choosedBrands.contains(brand[index])) {
                              _choosedBrands.remove(
                                brand[index],
                              );
                            } else {
                              _choosedBrands.add(
                                brand[index],
                              );
                            }
                          },
                        );
                      },
                      child: Container(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                brand[index],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: _choosedBrands.contains(brand[index])
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              margin: EdgeInsets.only(right: 20),
                              child: _choosedBrands.contains(brand[index])
                                  ? Center(
                                      child: Icon(
                                        Icons.check_box,
                                        color: Colors.red,
                                      ),
                                    )
                                  : Center(
                                      child: Icon(
                                        Icons.check_box_outline_blank,
                                        color: Colors.black,
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: 75,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Center(
                            child: Text(
                              'Discard',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop(_choosedBrands);
                        },
                        child: Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.red,
                          ),
                          child: Center(
                            child: Text(
                              'Apply',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
