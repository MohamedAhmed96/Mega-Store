import 'package:flutter/material.dart';

import '../screens/product_card_screen.dart';
import '../provider/products_provider.dart';

class TileFavorites extends StatefulWidget {
  final Product product;
  TileFavorites(this.product);
  @override
  _TileFavoritesState createState() => _TileFavoritesState();
}

class _TileFavoritesState extends State<TileFavorites> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      //color: Colors.blue,
      child: Stack(
        children: <Widget>[
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(ProductCardScreen.routeName);
              },
              child: Container(
                height: 100,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        child: widget.product.image,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.product.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.product.mark,
                            style: TextStyle(
                              fontSize: 14,
                              //fontWeight: FontWeight.bold,
                              color: Colors.grey.withOpacity(0.4),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              Icon(
                                Icons.star_border,
                                size: 18,
                              ),
                              Text(
                                '(${widget.product.rating})',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.withOpacity(0.4),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '${widget.product.price}\$',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          /* Positioned(
            top: 80,
            left: 315,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: widget.fav ? Colors.black12 : Colors.transparent,
                    blurRadius: widget.fav ? 10 : 0 ,
                  ),
                ],
                borderRadius: BorderRadius.circular(40),
                color: widget.fav ? Colors.red : Colors.transparent,
              ),
              child: Center(
                child: Icon(
                  widget.fav ? Icons.local_mall : Icons.local_mall,
                  size: 25,
                  color: widget.fav ? Colors.white : Colors.transparent,
                ),
              ),
            ),
          ), */
        ],
      ),
    );
  }
}
