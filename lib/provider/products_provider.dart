import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

class Product {
  final int id;
  final Image image;
  final double price;
  final String mark;
  final String name;
  final int rating;
  bool favorite = false;
  List<Color> colors;
  List<String> sizes;
  String category;
  String description;
  int quantity;
  bool inBag = false;
  int reservedQuantity = 0;

  Product({
    @required this.id,
    @required this.image,
    @required this.price,
    @required this.mark,
    @required this.name,
    @required this.rating,
    @required this.description,
    @required this.quantity,
    @required this.colors,
    @required this.sizes,
    @required this.category,
    this.favorite = false,
    this.inBag = false,
    this.reservedQuantity = 0,
  });
}

class Products with ChangeNotifier {
  List<Color> _choosedColors = [];
  List<String> _choosedSizes = [];
  List<String> _choosedCategories = [];
  List<Product> _products = [
    Product(
        id: 1,
        image: Image.asset(
          'lib/assets/images/new1.png',
          fit: BoxFit.cover,
        ),
        price: 12,
        mark: 'Dorothy Perkins',
        name: 'Evening Dress',
        rating: 5,
        quantity: 10,
        description:
            'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed',
        colors: [
          Colors.black,
          Colors.grey,
          Colors.red,
          Colors.brown,
          Colors.blue,
        ],
        sizes: ['S', 'M', 'L', 'XL', 'XS'],
        category: 'Women'),
    Product(
        id: 2,
        image: Image.asset(
          'lib/assets/images/new2.png',
          fit: BoxFit.cover,
        ),
        price: 12,
        mark: 'Dorothy Perkins',
        name: 'Evening Dress',
        rating: 5,
        quantity: 10,
        description:
            'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed',
        colors: [
          Colors.black,
          Colors.grey,
          Colors.red,
          Colors.brown,
          Colors.blue,
        ],
        sizes: ['S', 'M', 'L', 'XL', 'XS'],
        category: 'Women'),
    Product(
        id: 3,
        image: Image.asset(
          'lib/assets/images/new1.png',
          fit: BoxFit.cover,
        ),
        price: 12,
        mark: 'Dorothy Perkins',
        name: 'Evening Dress',
        rating: 5,
        quantity: 10,
        description:
            'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed',
        colors: [
          Colors.black,
          Colors.grey,
          Colors.red,
          Colors.brown,
          Colors.blue,
        ],
        sizes: ['S', 'M', 'L', 'XL', 'XS'],
        category: 'Women'),
    Product(
        id: 4,
        image: Image.asset(
          'lib/assets/images/photo.png',
          fit: BoxFit.cover,
        ),
        price: 9,
        mark: 'Mango',
        name: 'T-Shirt SPANISH',
        rating: 5,
        quantity: 10,
        description:
            'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed',
        colors: [
          Colors.black,
          Colors.grey,
          Colors.red,
          Colors.brown,
          Colors.blue,
        ],
        sizes: ['S', 'M', 'L', 'XL', 'XS'],
        category: 'Women'),
    Product(
        id: 5,
        image: Image.asset(
          'lib/assets/images/new1.png',
          fit: BoxFit.cover,
        ),
        price: 21,
        mark: 'Dorothy Perkins',
        name: 'Blouse',
        rating: 5,
        quantity: 10,
        description:
            'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed',
        colors: [
          Colors.black,
          Colors.grey,
          Colors.red,
          Colors.brown,
          Colors.blue,
        ],
        sizes: ['S', 'M', 'L', 'XL', 'XS'],
        category: 'Women'),
    Product(
        id: 6,
        image: Image.asset(
          'lib/assets/images/shortdress.png',
          fit: BoxFit.cover,
        ),
        price: 19.99,
        mark: 'H&M',
        name: 'Short black dress',
        rating: 10,
        quantity: 10,
        description:
            'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed',
        colors: [
          Colors.black,
          Colors.grey,
          Colors.red,
          Colors.brown,
          Colors.blue,
        ],
        sizes: ['S', 'M', 'L', 'XL', 'XS'],
        category: 'Women'),
    Product(
        id: 7,
        image: Image.asset(
          'lib/assets/images/new1.png',
          fit: BoxFit.cover,
        ),
        price: 51,
        mark: 'Mango',
        name: 'Pullover',
        rating: 5,
        quantity: 10,
        description:
            'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed',
        colors: [
          Colors.black,
          Colors.grey,
          Colors.red,
          Colors.brown,
          Colors.blue,
        ],
        sizes: ['S', 'M', 'L', 'XL', 'XS'],
        category: 'Women'),
    Product(
        id: 8,
        image: Image.asset(
          'lib/assets/images/new1.png',
          fit: BoxFit.cover,
        ),
        price: 51,
        mark: 'Mango',
        name: 'Pullover',
        rating: 5,
        quantity: 10,
        description:
            'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed',
        colors: [
          Colors.black,
          Colors.grey,
          Colors.red,
          Colors.brown,
          Colors.blue,
        ],
        sizes: ['S', 'M', 'L', 'XL', 'XS'],
        category: 'Women'),
    Product(
        id: 9,
        image: Image.asset(
          'lib/assets/images/new1.png',
          fit: BoxFit.cover,
        ),
        price: 51,
        mark: 'Mango',
        name: 'Pullover',
        rating: 5,
        quantity: 10,
        description:
            'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed',
        colors: [
          Colors.black,
          Colors.grey,
          Colors.red,
          Colors.brown,
          Colors.blue,
        ],
        sizes: ['S', 'M', 'L', 'XL', 'XS'],
        category: 'Women'),
    Product(
        id: 10,
        image: Image.asset(
          'lib/assets/images/new1.png',
          fit: BoxFit.cover,
        ),
        price: 43,
        mark: 'Dorothy Perkins',
        name: 'Sport Dress',
        rating: 5,
        quantity: 10,
        description:
            'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed',
        colors: [
          Colors.black,
          Colors.grey,
          Colors.red,
          Colors.brown,
          Colors.blue,
        ],
        sizes: ['S', 'M', 'L', 'XL', 'XS'],
        category: 'Women'),
    Product(
        id: 11,
        image: Image.asset(
          'lib/assets/images/new1.png',
          fit: BoxFit.cover,
        ),
        price: 43,
        mark: 'Dorothy Perkins',
        name: 'T-Shirt',
        rating: 5,
        quantity: 10,
        description:
            'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed',
        colors: [
          Colors.black,
          Colors.grey,
          Colors.red,
          Colors.brown,
          Colors.blue,
        ],
        sizes: ['S', 'M', 'L', 'XL', 'XS'],
        category: 'Women'),
    Product(
      id: 12,
      image: Image.asset(
        'lib/assets/images/new1.png',
        fit: BoxFit.cover,
      ),
      price: 10,
      mark: 'Lime',
      name: 'Shirt',
      colors: [
        Colors.blue,
      ],
      sizes: ['S', 'M', 'L', 'XL', 'XS'],
      category: 'Women',
      rating: 10,
      quantity: 10,
      description:
          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed',
      inBag: true,
      reservedQuantity: 1,
    ),
    Product(
      id: 13,
      image: Image.asset(
        'lib/assets/images/new1.png',
        fit: BoxFit.cover,
      ),
      price: 46,
      mark: 'Mango',
      name: 'Longsleeve Violeta',
      colors: [
        Colors.orange,
      ],
      sizes: [
        'S', /* 'M', 'L', 'XL', 'XS' */
      ],
      category: 'Women',
      rating: 0,
      quantity: 10,
      description:
          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed',
      inBag: true,
      reservedQuantity: 1,
    ),
    Product(
      id: 14,
      image: Image.asset(
        'lib/assets/images/new1.png',
        fit: BoxFit.cover,
      ),
      price: 52,
      mark: 'Olivier',
      name: 'Shirt',
      colors: [
        Colors.grey,
      ],
      sizes: ['S', 'M', 'L', 'XL', 'XS'],
      category: 'Women',
      rating: 10,
      quantity: 10,
      description:
          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed',
    ),
    Product(
      id: 15,
      image: Image.asset(
        'lib/assets/images/new1.png',
        fit: BoxFit.cover,
      ),
      price: 55,
      mark: '&Berries',
      name: 'T-Shirt',
      colors: [
        Colors.black,
      ],
      sizes: ['S', 'M', 'L', 'XL', 'XS'],
      category: 'Women',
      rating: 0,
      quantity: 10,
      description:
          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed',
    ),
    Product(
        id: 16,
        image: Image.asset(
          'lib/assets/images/new1.png',
          fit: BoxFit.cover,
        ),
        price: 22,
        mark: 'Sittly',
        name: 'Sport Dress',
        rating: 10,
        quantity: 10,
        description:
            'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed',
        colors: [
          Colors.black,
          Colors.grey,
          Colors.red,
          Colors.brown,
          Colors.blue,
        ],
        sizes: ['S', 'M', 'L', 'XL', 'XS'],
        category: 'Women'),
    Product(
        id: 17,
        image: Image.asset(
          'lib/assets/images/new1.png',
          fit: BoxFit.cover,
        ),
        price: 34,
        mark: 'Dorothy Perkins',
        name: 'Blouse',
        rating: 0,
        quantity: 10,
        description:
            'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed',
        colors: [
          Colors.black,
          Colors.grey,
          Colors.red,
          Colors.brown,
          Colors.blue,
        ],
        sizes: ['S', 'M', 'L', 'XL', 'XS'],
        category: 'Women'),
    Product(
        id: 18,
        image: Image.asset(
          'lib/assets/images/new1.png',
          fit: BoxFit.cover,
        ),
        price: 43,
        mark: 'LOST Ink',
        name: 'T-Shirt',
        rating: 5,
        quantity: 10,
        description:
            'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed',
        colors: [
          Colors.black,
          Colors.grey,
          Colors.red,
          Colors.brown,
          Colors.blue,
        ],
        sizes: ['S', 'M', 'L', 'XL', 'XS'],
        category: 'Women'),
    Product(
        id: 19,
        image: Image.asset(
          'lib/assets/images/new1.png',
          fit: BoxFit.cover,
        ),
        price: 51,
        mark: 'Topshop',
        name: 'Shirt',
        rating: 3,
        quantity: 10,
        description:
            'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed',
        colors: [
          Colors.black,
          Colors.grey,
          Colors.red,
          Colors.brown,
          Colors.blue,
        ],
        sizes: ['S', 'M', 'L', 'XL', 'XS'],
        category: 'Women'),
  ];

  List<Product> get products {
    return [..._products];
  }

  List<Product> get favorites {
    return _products.where((element) => element.favorite).toList();
  }

  void addToFavorites(int id) {
    var prodIdex = _products.indexWhere((element) => element.id == id);
    _products.elementAt(prodIdex).favorite =
        !_products.elementAt(prodIdex).favorite;
    notifyListeners();
  }

  List<Product> prodNames(String name) {
    return _products.where((element) => element.name == name).toList();
  }

  List<String> get names {
    List<String> _names = [];
    for (int i = 0; i < _products.length; i++) {
      _names.add(_products[i].name);
    }
    for (int i = 0; i < _names.length; i++) {
      var name = _names[i];
      for (int j = i + 1; j < _names.length; j++) {
        if (_names[j] == name) {
          _names.removeAt(j);
          j--;
        }
      }
    }
    return _names.toList();
  }

  List<String> get brands {
    List<String> _barnds = [];
    for (int i = 0; i < _products.length; i++) {
      _barnds.add(_products[i].mark);
    }
    for (int i = 0; i < _barnds.length; i++) {
      var brand = _barnds[i];
      for (int j = i + 1; j < _barnds.length; j++) {
        if (_barnds[j] == brand) {
          _barnds.removeAt(j);
          j--;
        }
      }
    }
    return _barnds.toList();
  }

  List<Color> get colors {
    List<Color> _colors = [];
    for (int i = 0; i < _products.length; i++) {
      for (int j = 0; j < _products[i].colors.length; j++)
        _colors.add(_products[i].colors[j]);
    }
    for (int i = 0; i < _colors.length; i++) {
      var color = _colors[i];
      for (int j = i + 1; j < _colors.length; j++) {
        if (_colors[j] == color) {
          _colors.removeAt(j);
          j--;
        }
      }
    }
    return _colors.toList();
  }

  List<String> get sizes {
    List<String> _sizes = [];
    for (int i = 0; i < _products.length; i++) {
      for (int j = 0; j < _products[i].sizes.length; j++)
        _sizes.add(_products[i].sizes[j]);
    }
    for (int i = 0; i < _sizes.length; i++) {
      var color = _sizes[i];
      for (int j = i + 1; j < _sizes.length; j++) {
        if (_sizes[j] == color) {
          _sizes.removeAt(j);
          j--;
        }
      }
    }
    return _sizes.toList();
  }

  List<String> get category {
    List<String> _categories = [];
    for (int i = 0; i < _products.length; i++) {
      _categories.add(_products[i].category);
    }
    for (int i = 0; i < _categories.length; i++) {
      var color = _categories[i];
      for (int j = i + 1; j < _categories.length; j++) {
        if (_categories[j] == color) {
          _categories.removeAt(j);
          j--;
        }
      }
    }
    return _categories.toList();
  }

  Product findById(int id) {
    return _products.firstWhere((element) => element.id == id);
  }

  List<Product> sort(List<Product> products, int sortIndex) {
    switch (sortIndex) {
      case 2:
        for (int i = 0; i < products.length; i++) {
          for (int j = i + 1; j < products.length; j++) {
            if (products[j].rating >= products[i].rating) {
              var x = products[j];
              products.removeAt(j);
              products.insert(i, x);
            }
          }
        }
        return products;
        break;
      case 3:
        for (int i = 0; i < products.length; i++) {
          for (int j = i + 1; j < products.length; j++) {
            if (products[j].price <= products[i].price) {
              var x = products[j];
              products.removeAt(j);
              products.insert(i, x);
            }
          }
        }
        return products;
        break;
      case 4:
        for (int i = 0; i < products.length; i++) {
          for (int j = i + 1; j < products.length; j++) {
            if (products[j].price >= products[i].price) {
              var x = products[j];
              products.removeAt(j);
              products.insert(i, x);
            }
          }
        }
        return products;
        break;
      default:
        return products;
    }
  }

  double get maxPrice {
    var max = _products[0].price;
    for (int i = 1; i < _products.length; i++) {
      if (_products[i].price > max) {
        max = _products[i].price;
      }
    }
    return max;
  }

  List<Product> filter(
      List<Color> choosedColors,
      RangeValues priceRange,
      List<String> choosedSizes,
      List<String> choosedCategoryies,
      List<String> choosedBrands,
      List<Product> products) {
    if (choosedColors.length != 0) {
      // to filter products by choosed colors
      for (int i = 0; i < products.length; i++) {
        for (int j = 0; j < choosedColors.length; j++) {
          if (!products[i]
              .colors
              .any((element) => choosedColors.contains(element))) {
            products.removeAt(i);
            if (products.length > 0) {
              i--;
            }
          }
        }
      }
    }
    if (choosedSizes.length != 0) {
      // to filter products by choosed sizes
      for (int i = 0; i < products.length; i++) {
        for (int j = 0; j < choosedSizes.length; j++) {
          if (!products[i]
              .sizes
              .any((element) => choosedSizes.contains(element))) {
            products.removeAt(i);
            if (products.length > 0) {
              i--;
            }
          }
        }
      }
    }
    if (choosedCategoryies.length != 0) {
      // to filter products by choosed category
      products.removeWhere(
          (element) => !choosedCategoryies.contains(element.category));
    }
    if (choosedBrands.length != 0) {
      // to filter products by choosed category
      products.removeWhere((element) => !choosedBrands.contains(element.mark));
    }
    // to filter products by price range
    print('products length = ${products.length}');
    products.removeWhere((element) =>
        element.price < priceRange.start || element.price > priceRange.end);
    print('products length = ${products.length}');
    print('method price range = $priceRange');
    return products;
  }

  List<String> productColors(int id) {
    List<Color> _productColors =
        products.firstWhere((element) => element.id == id).colors;
    List<String> productColorsNames = [];
    for (int i = 0; i < _productColors.length; i++) {
      productColorsNames.add(getColorNameFromColor(_productColors[i]).getName);
    }
    return productColorsNames;
  }

  List<String> productSizes(int id) {
    return products.firstWhere((element) => element.id == id).sizes;
  }

  List<int> get bagItemsIDs {
    List<Product> productsInBag =
        products.where((element) => element.inBag).toList();
    List<int> _bagItems = [];
    for (int i = 0; i < productsInBag.length; i++) {
      _bagItems.add(productsInBag[i].id);
    }
    return _bagItems;
  }

  void reservedQuantityIncrement(int id) {
    if (products.firstWhere((element) => element.id == id).reservedQuantity <
        products.firstWhere((element) => element.id == id).quantity) {
      products.firstWhere((element) => element.id == id).reservedQuantity =
          products.firstWhere((element) => element.id == id).reservedQuantity +
              1;
    }
    notifyListeners();
  }

  void reservedQuantityDecrement(int id) {
    if (products.firstWhere((element) => element.id == id).reservedQuantity >
        1) {
      products.firstWhere((element) => element.id == id).reservedQuantity =
          products.firstWhere((element) => element.id == id).reservedQuantity -
              1;
    }
    notifyListeners();
  }

  void addItemFromBag(int id) {
    products.firstWhere((element) => element.id == id).inBag = true;
    products.firstWhere((element) => element.id == id).reservedQuantity = 1;
    notifyListeners();
  }

  void removeItemFromBag(int id) {
    products.firstWhere((element) => element.id == id).inBag = false;
    products.firstWhere((element) => element.id == id).reservedQuantity = 0;
    notifyListeners();
  }

  bool itemAlreadyInBag(id) {
    return products.firstWhere((element) => element.id == id).inBag;
  }

  double get bagTotalCost {
    var total = 0.0;
    for (int i = 0; i < bagItemsIDs.length; i++) {
      total = total +
          products.firstWhere((element) => element.id == bagItemsIDs[i]).price *
              products
                  .firstWhere((element) => element.id == bagItemsIDs[i])
                  .reservedQuantity;
    }
    return total;
  }
}
