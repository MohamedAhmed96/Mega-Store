import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/products_provider.dart';

class BagItem extends StatefulWidget {
  final int productId;
  BagItem(this.productId);
  @override
  _BagItemState createState() => _BagItemState();
}

enum WhyFarther { addToFavorites, deleteFromTheList }

class _BagItemState extends State<BagItem> {
  //var _quantity = 1;
  @override
  Widget build(BuildContext context) {
    final Products product = Provider.of<Products>(context);
    return Container(
      height: MediaQuery.of(context).size.height * 0.135,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            color: Colors.black12,
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    height: constraints.maxHeight,
                    width: constraints.maxWidth * 0.33,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        child: product.findById(widget.productId).image),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: constraints.maxHeight * 0.1,
                      horizontal: constraints.maxWidth * 0.01,
                    ),
                    //color: Colors.blue,
                    height: constraints.maxHeight,
                    width: constraints.maxWidth * 0.55,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: constraints.maxHeight * 0.2,
                          width: constraints.maxWidth * 0.55,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            product.findById(widget.productId).name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          height: constraints.maxHeight * 0.2,
                          width: constraints.maxWidth * 0.55,
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Color: ',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                  ),
                                  Container(
                                    width: 60,
                                    //color: Colors.red,
                                    child: Text(
                                      product
                                          .productColors(widget.productId)[0],
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Size: ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.withOpacity(0.5),
                                      ),
                                    ),
                                    Container(
                                      width: 30,
                                      child: Text(
                                        product
                                            .findById(widget.productId)
                                            .sizes[0],
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                        softWrap: false,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: constraints.maxHeight * 0.4,
                          width: constraints.maxWidth * 0.55,
                          alignment: Alignment.centerLeft,
                          //padding: EdgeInsets.only(top: 10),
                          //color: Colors.blue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    product.reservedQuantityDecrement(
                                        widget.productId);
                                  });
                                },
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  //margin: const EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.grey.withOpacity(0.7),
                                    size: 25,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Text(
                                  product
                                      .findById(widget.productId)
                                      .reservedQuantity
                                      .toString(),
                                  style: TextStyle(
                                    color: Colors.grey.withOpacity(0.7),
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    product.reservedQuantityIncrement(
                                        widget.productId);
                                  });
                                },
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  /* margin: const EdgeInsets.only(
                                    top: 10,
                                  ), */
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.grey.withOpacity(0.7),
                                    size: 25,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: constraints.maxHeight * 1,
                width: constraints.maxWidth * 0.1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    PopupMenuButton<WhyFarther>(
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.grey.withOpacity(0.7),
                      ),
                      onSelected: (WhyFarther result) {
                        setState(() {
                          if (result == WhyFarther.addToFavorites) {
                            product.findById(widget.productId).favorite = true;
                          } else {
                            product.removeItemFromBag(widget.productId);
                          }
                          //_selection = result;
                        });
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<WhyFarther>>[
                        const PopupMenuItem<WhyFarther>(
                          value: WhyFarther.addToFavorites,
                          child: Center(child: Text('Add to favorites')),
                        ),
                        PopupMenuDivider(),
                        const PopupMenuItem<WhyFarther>(
                          value: WhyFarther.deleteFromTheList,
                          child: Center(child: Text('Delete from the list')),
                        ),
                      ],
                    ),
                    /* GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.more_vert,
                      color: Colors.grey.withOpacity(0.7),
                      size: 25,
                    ),
                  ), */
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: FittedBox(
                        child: Text(
                          '${product.findById(widget.productId).price}\$',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
