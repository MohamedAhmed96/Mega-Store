import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './brand_screen.dart';
import '../provider/products_provider.dart';

class FiltersScreen extends StatefulWidget {
  static String routeName = '/filters';
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  List<Color> _choosedColors = [];
  List<String> _choosedSizes = [];
  List<String> _choosedCategories = [];
  List<String> _choosedBrands = [];
  var _rangeValues = RangeValues(2, 20);
  @override
  Widget build(BuildContext context) {
    final col = Provider.of<Products>(context).colors;
    final size = Provider.of<Products>(context).sizes;
    final category = Provider.of<Products>(context).category;
    final brand = Provider.of<Products>(context).brands;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            Navigator.pop(context);
          },
          child: Icon(
            CupertinoIcons.back,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 575,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Text(
                      'Price range',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: 90,
                    color: Colors.white,
                    child: RangeSlider(
                      activeColor: Colors.red,
                      inactiveColor: Colors.grey,
                      values: _rangeValues,
                      min: 0,
                      max: Provider.of<Products>(context).maxPrice,
                      labels: RangeLabels(
                        _rangeValues.start.toString(),
                        _rangeValues.end.toString(),
                      ),
                      onChanged: (newValues) {
                        print(
                            'START: ${newValues.start}, END: ${newValues.end}');
                        setState(() {
                          _rangeValues = newValues;
                        });
                      },
                      divisions: 4,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Text(
                      'Colors',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: 90,
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, index) {
                              return Container(
                                padding: const EdgeInsets.only(left: 10),
                                margin: EdgeInsets.symmetric(vertical: 20),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(
                                      () {
                                        if (_choosedColors
                                            .contains(col[index])) {
                                          _choosedColors.remove(col[index]);
                                        } else {
                                          _choosedColors.add(col[index]);
                                        }
                                      },
                                    );
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                        color:
                                            //_choosen[index]
                                            _choosedColors.contains(col[index])
                                                ? Colors.red
                                                : Colors.transparent,
                                        width: 1,
                                      ),
                                    ),
                                    child: Center(
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          color: col[index],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: col.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Text(
                      'Sizes',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: 90,
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, index) {
                              return Container(
                                padding: const EdgeInsets.only(left: 10),
                                margin: EdgeInsets.symmetric(vertical: 20),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (_choosedSizes.contains(size[index])) {
                                        _choosedSizes.remove(size[index]);
                                      } else {
                                        _choosedSizes.add(size[index]);
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: _choosedSizes.contains(size[index])
                                          ? Colors.red
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color:
                                            _choosedSizes.contains(size[index])
                                                ? Colors.transparent
                                                : Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        size[index],
                                        style: TextStyle(
                                          color: _choosedSizes
                                                  .contains(size[index])
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: size.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Text(
                      'Category',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 140,
                              childAspectRatio: 5 / 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                            ),
                            itemBuilder: (ctx, index) {
                              return Container(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (_choosedCategories
                                          .contains(category[index])) {
                                        _choosedCategories
                                            .remove(category[index]);
                                      } else {
                                        _choosedCategories.add(category[index]);
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: _choosedCategories
                                              .contains(category[index])
                                          ? Colors.red
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: _choosedCategories
                                                .contains(category[index])
                                            ? Colors.transparent
                                            : Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        category[index],
                                        style: TextStyle(
                                          color: _choosedCategories
                                                  .contains(category[index])
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: category.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(BrandScreen.routeName)
                          .then((value) {
                        setState(() {
                          _choosedBrands = value;
                        });
                      });
                    },
                    child: Container(
                      height: 80,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Brand',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${brand[0]}, ${brand[1]}, ${brand[2]}',
                                      style: TextStyle(
                                        color: Colors.grey.withOpacity(0.8),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  CupertinoIcons.forward,
                                  color: Colors.grey.withOpacity(0.8),
                                ),
                              ],
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
                      Navigator.of(context).pop([
                        _choosedColors,
                        _rangeValues,
                        _choosedSizes,
                        _choosedCategories,
                        _choosedBrands,
                      ]);
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
    );
  }
}
