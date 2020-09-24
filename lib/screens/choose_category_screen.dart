import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mega_store/screens/categories_screen.dart';
import 'package:provider/provider.dart';

import '../provider/nav_bar_wid_tab.dart';
import './tile_choosen_category_screen.dart';
import '../widgets/categories.dart';

class ChooseCategoryScreen extends StatelessWidget {
  static String routeName = '/chooseCategory';
  final int categoryIndex;
  ChooseCategoryScreen({this.categoryIndex});
  @override
  Widget build(BuildContext context) {
    final catg = Provider.of<Categories>(context);
    final current = Provider.of<NavBarWidTab>(context);
    //final int _categoryIndex = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Categories',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            current.goTo(CategoriesScreen(), 1);
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
        height: double.infinity,
        width: double.infinity,
        //color: Colors.indigo,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                height: 50,
                width: 330,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.red,
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: Center(
                    child: Text(
                      'VIEW ALL ITEMS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
              child: Text(
                'Choose category',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ),
            Container(
              //color: Colors.blueAccent,
              height: 460,
              width: 350,
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: ListView.builder(
                          itemCount: catg.catgDetailLength(categoryIndex),
                          itemBuilder: (ctx, index) {
                            return Container(
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 30),
                                      child: GestureDetector(
                                        onTap: () {
                                          current.goTo(
                                              TileChoosenCategoryScreen(categoryIndex: categoryIndex,), 1);
                                        },
                                        child: Text(
                                          catg.catgDetail(categoryIndex, index),
                                        ),
                                      ),
                                    ),
                                    Divider(),
                                  ],
                                ),
                              ),
                            );
                          }))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
