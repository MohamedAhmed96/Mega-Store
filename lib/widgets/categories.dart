import 'package:flutter/material.dart';

import './category.dart';

class Categories with ChangeNotifier {
  Map<Category, dynamic> _catgList = {
    Category(
      catgName: 'New',
      catgImage: Image.asset('lib/assets/images/image41.png'),
    ): [
      'Tops',
      'Shirts & Blouses',
      'Cardigans & Sweaters',
      'Knitwear',
      'Blazers',
      'Outwear',
      'Pants',
      'Jeans',
      'Shorts',
      'Skirts',
      'Dresses',],
    Category(
      catgName: 'Clothes',
      catgImage: Image.asset('lib/assets/images/image2.png'),
    ): [
      'Tops',
      'Shirts & Blouses',
      'Cardigans & Sweaters',
      'Knitwear',
      'Blazers',
      'Outwear',
      'Pants',
      'Jeans',
      'Shorts',
      'Skirts',
      'Dresses',
    ],
    Category(
      catgName: 'Shoes',
      catgImage: Image.asset('lib/assets/images/image22.png'),
    ): [
      'Tops',
      'Shirts & Blouses',
      'Cardigans & Sweaters',
      'Knitwear',
      'Blazers',
      'Outwear',
      'Pants',
      'Jeans',
      'Shorts',
      'Skirts',
      'Dresses',],
    Category(
      catgName: 'Accessories',
      catgImage: Image.asset('lib/assets/images/image31.png'),
    ): [
      'Tops',
      'Shirts & Blouses',
      'Cardigans & Sweaters',
      'Knitwear',
      'Blazers',
      'Outwear',
      'Pants',
      'Jeans',
      'Shorts',
      'Skirts',
      'Dresses',],
  };

  List<Category> get catgList {
    return [..._catgList.keys];
  }

  String catgDetail(int key, int val){
    var value = [..._catgList.values];
    return value[key][val];
  }

  int catgDetailLength (int key){
    var value = [..._catgList.values];
    var list =  value[key];
    return list.length;
  }

}
