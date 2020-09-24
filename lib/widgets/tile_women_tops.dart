import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_card_screen.dart';
import '../provider/products_provider.dart';

class TileWomenTops extends StatefulWidget {
  final Product product;
  TileWomenTops({@required this.product});
  @override
  _TileWomenTopsState createState() => _TileWomenTopsState();
}

class _TileWomenTopsState extends State<TileWomenTops> {
  var fav = false;
  @override
  Widget build(BuildContext context) {
    final prod = Provider.of<Products>(context);
    return Container(
      height: 120,
      width: double.infinity,
      //color: Colors.blue,
      child: Stack(
        children: <Widget>[
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  ProductCardScreen.routeName,
                  arguments: widget.product.id,
                );
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
                                '(${widget.product.rating.toString()})',
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
          Positioned(
            top: 80,
            left: 315,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  prod.addToFavorites(widget.product.id);
                });
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                ),
                child: Center(
                  child: Icon(
                    widget.product.favorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    size: 25,
                    color: widget.product.favorite ? Colors.red : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
