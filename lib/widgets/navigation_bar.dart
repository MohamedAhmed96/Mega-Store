import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../provider/nav_bar_wid_tab.dart';
import '../screens/categories_screen.dart';
import '../screens/home_screen.dart';
import '../screens/my_profile_screen.dart';
import '../screens/tile_favorites_screen.dart';
import '../screens/my_bag_screen.dart';

class NavigationBar extends StatefulWidget {
  static String routeName = '/navigation-bar';
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  var _tab ;

  final List<Widget> _children = [
    HomeScreen(),
    CategoriesScreen(),
    MyBagScreen(),
    TileFavoritesScreen(),
    MyProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final current = Provider.of<NavBarWidTab>(context);
    Widget _current = current.arg.wid == null ? HomeScreen() : current.arg.wid;
    _tab = current.arg.tab == null ? 0 : current.arg.tab;
    print('_tab = $_tab ');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _current,
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.grey.withOpacity(0.3),
                  size: 32,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(color: Colors.red),
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.red,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.local_grocery_store,
                  color: Colors.grey.withOpacity(0.3),
                  size: 32,
                ),
                title: Text(
                  'Shop',
                  style: TextStyle(color: Colors.red),
                ),
                activeIcon: Icon(
                  Icons.shopping_cart,
                  color: Colors.red,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.local_mall,
                  color: Colors.grey.withOpacity(0.3),
                ),
                title: Text(
                  'Bag',
                  style: TextStyle(color: Colors.red),
                ),
                activeIcon: Icon(
                  Icons.local_mall,
                  color: Colors.red,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.grey.withOpacity(0.3),
                  size: 32,
                ),
                title: Text(
                  'Favorites',
                  style: TextStyle(color: Colors.red),
                ),
                activeIcon: Icon(
                  CupertinoIcons.heart_solid,
                  color: Colors.red,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.grey.withOpacity(0.3),
                  size: 32,
                ),
                title: Text(
                  'Profile',
                  style: TextStyle(color: Colors.red),
                ),
                activeIcon: Icon(
                  Icons.person,
                  color: Colors.red,
                ),
              ),
            ],
            selectedLabelStyle: TextStyle(color: Colors.black),
            unselectedLabelStyle:
                TextStyle(color: Colors.green.withOpacity(0.3)),
            currentIndex: _tab,
            onTap: (value) {
              setState(() {
                current.goTo(_children[value], value);
              });
            },
          ),
        ),
      ),
    );
  }
}