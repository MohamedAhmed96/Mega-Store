import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class GridFavorites extends StatefulWidget {
  final bool fav;
  GridFavorites(this.fav);
  @override
  _GridFavoritesState createState() => _GridFavoritesState();
}

class _GridFavoritesState extends State<GridFavorites> {
  @override
  Widget build(BuildContext context) {
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
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.withOpacity(0.8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'lib/assets/images/new1.png',
                fit: BoxFit.cover,
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
              '(10)',
              style: TextStyle(
                color: Colors.grey.withOpacity(0.5),
                //backgroundColor: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.34,
            child: Text(
              'Dorothy Perkins',
              style: TextStyle(
                color: Colors.grey.withOpacity(0.5),
                //backgroundColor: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.37,
            child: Text(
              'Evening Dress',
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
              '12\$',
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
          ),
          /* Positioned(
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
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: widget.fav ? Colors.black12 : Colors.transparent,
                      blurRadius: widget.fav ? 10 : 0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                ),
                child: Center(
                  child: Icon(
                    widget.fav ? Icons.local_mall : Icons.local_mall,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ), */
        ],
      ),
    );
  }
}
