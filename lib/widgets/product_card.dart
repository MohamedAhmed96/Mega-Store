import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../provider/products_provider.dart';
import '../screens/product_card_screen.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  ProductCard({@required this.product});
  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final prod = Provider.of<Products>(context);
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        //color: Colors.blue,
      ),
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                ProductCardScreen.routeName,
                arguments: widget.product.id,
              );
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.withOpacity(0.8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: widget.product.image,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.29,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (ctx, index) {
                                return Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 17,
                                );
                              }),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.31,
            left: MediaQuery.of(context).size.width * 0.25,
            child: Text(
              '(${widget.product.rating.toString()})',
              style: TextStyle(
                color: Colors.grey.withOpacity(0.5),
                //backgroundColor: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.34,
            child: Text(
              widget.product.mark,
              style: TextStyle(
                color: Colors.grey.withOpacity(0.5),
                //backgroundColor: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.37,
            child: Text(
              widget.product.name,
              style: TextStyle(
                color: Colors.black,
                //backgroundColor: Colors.white,
                fontFamily: 'Metropolis',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.41,
            child: Text(
              '${widget.product.price}\$',
              style: TextStyle(
                color: Colors.black,
                //backgroundColor: Colors.white,
                fontFamily: 'Metropolis',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.27,
            left: MediaQuery.of(context).size.width * 0.36,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 5,
                  ),
                ],
              ),
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
          ),
        ],
      ),
    );
  }
}
