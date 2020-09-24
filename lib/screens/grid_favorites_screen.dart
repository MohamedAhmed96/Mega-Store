import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

import '../provider/nav_bar_wid_tab.dart';
import '../widgets/grid_favorites.dart';
import './tile_favorites_screen.dart';
import './filters_screen.dart';

class GridFavoritesScreen extends StatefulWidget {
  static String routeName = '/gridFavorites';
  /* final int categoryIndex;
  GridFavoritesScreen({this.categoryIndex}); */
  @override
  _GridFavoritesScreenState createState() => _GridFavoritesScreenState();
}

class _GridFavoritesScreenState extends State<GridFavoritesScreen> {
  List categorii = ['Summer', 'T-shirts', 'Shirts', 'Shirts'];
  @override
  Widget build(BuildContext context) {
    final current = Provider.of<NavBarWidTab>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          )
        ],
        centerTitle: true,
        title: Text(
          'Women\'s tops',
          style: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: 585,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /* Padding(
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
            ), */
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
                        return Container(
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
                              categorii[index],
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: categorii.length,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.grey.withOpacity(0.1),
              height: 30,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, FiltersScreen.routeName);
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
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.import_export,
                        color: Colors.black,
                      ),
                      Text(
                        'Price low to high',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        child: GestureDetector(
                          onTap: () {
                            current.goTo(
                                TileFavoritesScreen(),
                                3);
                          },
                          child: Icon(
                            Icons.storage,
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
              height: 490,
              width: double.infinity,
              color: Colors.white,
              margin: const EdgeInsets.all(5),
              child: GridView(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  childAspectRatio: 1 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                ),
                children: <Widget>[
                  GridFavorites(true),
                  GridFavorites(true),
                  GridFavorites(false),
                  GridFavorites(true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
