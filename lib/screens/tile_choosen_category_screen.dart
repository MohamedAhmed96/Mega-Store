import 'package:flutter/material.dart';
import 'package:mega_store/screens/choose_category_screen.dart';
import 'package:mega_store/screens/filters_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

import '../provider/nav_bar_wid_tab.dart';
import '../provider/products_provider.dart';
import '../widgets/tile_women_tops.dart';
import './grid_choosen_category_screen.dart';

class TileChoosenCategoryScreen extends StatefulWidget {
  static String routeName = '/tileChoosen';
  final int categoryIndex;
  TileChoosenCategoryScreen({this.categoryIndex});
  @override
  _TileChoosenCategoryScreenState createState() =>
      _TileChoosenCategoryScreenState();
}

class _TileChoosenCategoryScreenState extends State<TileChoosenCategoryScreen> {
  var _selectedSort = 3;
  List categorii = ['T-shirts', 'Crop tops', 'Sleeveless', 'Sleeve'];
  List sorts = [
    'Popular',
    'Newest',
    'Customer review',
    'Price: lowest to high',
    'Price: highest to low',
  ];
  void sortSheet(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        context: context,
        builder: (_) {
          return Container(
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(15),
                  child: Center(
                      child: Text(
                    'Sort by',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (ctx, index) {
                            return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedSort = index;
                                  });
                                  Navigator.pop(context);
                                },
                                child: _selectedSort == index
                                    ? Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.only(
                                          left: 10,
                                        ),
                                        color: Colors.red,
                                        height: 45,
                                        child: Text(
                                          sorts[index],
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.only(
                                          left: 10,
                                        ),
                                        height: 45,
                                        child: Text(
                                          sorts[index],
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ));
                          },
                          itemCount: sorts.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  String category = 'T-Shirt';

  @override
  Widget build(BuildContext context) {
    final current = Provider.of<NavBarWidTab>(context);
    final prod = Provider.of<Products>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            current.goTo(
                ChooseCategoryScreen(
                  categoryIndex: widget.categoryIndex,
                ),
                1);
          },
          child: Icon(
            CupertinoIcons.back,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: Text(
                'Women\'s tops',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Metropolis',
                ),
              ),
            ),
            Container(
              height: 45,
              width: double.infinity,
              color: Colors.grey.withOpacity(0.05),
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              category = prod.names[index];
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(10, 0, 0, 5),
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 25,
                            ),
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black,
                            ),
                            child: Center(
                              child: Text(
                                prod.names[index],
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: prod.names.length,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.grey.withOpacity(0.05),
              height: 30,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, FiltersScreen.routeName,
                          arguments: widget.categoryIndex);
                    },
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Icon(
                            Icons.filter_list,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Filters',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      sortSheet(context);
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.import_export,
                          color: Colors.black,
                        ),
                        Text(
                          sorts[_selectedSort],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        child: GestureDetector(
                          onTap: () {
                            current.goTo(
                                GridChoosenCategoryScreen(
                                  categoryIndex: widget.categoryIndex,
                                ),
                                1);
                          },
                          child: Icon(
                            Icons.view_module,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 435,
              width: double.infinity,
              color: Colors.grey.withOpacity(0.1),
              margin: const EdgeInsets.only(top: 10),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemCount: prod.prodNames(category).length,
                      itemBuilder: (ctx, index) {
                        return TileWomenTops(
                          product: prod.prodNames(category)[index],
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
