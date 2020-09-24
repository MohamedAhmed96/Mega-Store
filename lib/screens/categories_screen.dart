import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/nav_bar_wid_tab.dart';
import '../widgets/women_categories.dart';
import '../screens/home_screen.dart';

class CategoriesScreen extends StatefulWidget {
  static String routeName = '/catgScr';
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    final current = Provider.of<NavBarWidTab>(context);
    var index = 0;
    final List<Widget> _tab = [
      WomenCategories(),
      WomenCategories(),
      WomenCategories(),
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          //elevation: 10,
          flexibleSpace: Container(
            color: Colors.grey.withOpacity(0.04),
            margin: EdgeInsets.only(top: 85),
          ),
          bottom: TabBar(
            onTap: (value){
              setState(() {
                index = value;
              });
            },
              unselectedLabelStyle: TextStyle(
                fontSize: 16,
                //fontWeight: FontWeight.bold,
              ),
              labelStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              labelPadding: const EdgeInsets.symmetric(vertical: 12),
              indicatorColor: Colors.red,
              tabs: [
                Text(
                  'Women',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Men',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Kids',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ]),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Categories',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: GestureDetector(
            onTap: (){
              current.goTo(HomeScreen(), 0);
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
        body: _tab[index],
      ),
    );
  }
}
