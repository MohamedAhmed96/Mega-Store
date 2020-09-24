import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/choose_category_screen.dart';
import '../widgets/categories.dart';
import '../provider/nav_bar_wid_tab.dart';

class WomenCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cat = Provider.of<Categories>(context);
    final current = Provider.of<NavBarWidTab>(context);
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.grey.withOpacity(0.1),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 85,
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'SUMMER SALES',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontFamily: 'Metropolis'),
                  ),
                  Text(
                    '\nUp to 50 % off',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Metropolis'),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: 450,
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    MediaQuery.removePadding(
                      context: context,
                      removeBottom: true,
                      removeTop: true,
                      child: Expanded(
                        child: ListView.builder(
                          itemBuilder: (ctx, index) {
                            return Container(
                              height: 95,
                              margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: GestureDetector(
                                onTap: () {
                                  current.goTo(ChooseCategoryScreen(categoryIndex: index,), 1);
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        cat.catgList[index].catgName,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 24),
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                      child: cat.catgList[index].catgImage,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: cat.catgList.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
