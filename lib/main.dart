import 'package:flutter/material.dart';

import './screens/choose_category_screen.dart';
import 'package:provider/provider.dart';

import './screens/my_profile_screen.dart';
import './screens/login_screen.dart';
import './screens/sign_up_screen.dart';
import './screens/forgot_password_screen.dart';
import './screens/tile_choosen_category_screen.dart';
import './screens/grid_choosen_category_screen.dart';
import './screens/categories_screen.dart';
import './screens/filters_screen.dart';
import './screens/brand_screen.dart';
import './screens/product_card_screen.dart';
import './screens/tile_favorites_screen.dart';
import './screens/my_bag_screen.dart';
import './screens/my_orders_screen.dart';
import './screens/order_check_out_screen.dart';
import './screens/adding_shipping_address_screen.dart';
import './screens/choosing_shipping_addresses_screen.dart';
import './widgets/navigation_bar.dart';
import './widgets/categories.dart';
import './widgets/colors_list.dart';
import './widgets/sizes_list.dart';
import './widgets/category_list.dart';
import './provider/nav_bar_wid_tab.dart';
import './provider/my_profile_provider.dart';
import './provider/address_provider.dart';
import './provider/products_provider.dart';
import './provider/filter_provider.dart';
import './screens/order_detail_screen.dart';
import './screens/settings_screen.dart';
import './screens/add_new_card_screen.dart';
import './screens/payment_methods_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Categories(),
        ),
        ChangeNotifierProvider.value(
          value: NavBarWidTab(),
        ),
        ChangeNotifierProvider.value(
          value: MyProfileProvider(),
        ),
        ChangeNotifierProvider.value(
          value: MyProfileProvider(),
        ),
        ChangeNotifierProvider.value(
          value: ColorsList(),
        ),
        ChangeNotifierProvider.value(
          value: SizesList(),
        ),
        ChangeNotifierProvider.value(
          value: CategoryList(),
        ),
        ChangeNotifierProvider.value(
          value: AddressProvider(),
        ),
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        /* ProxyProvider<Products, Filter>(
          update: (_, products, __) => Filter(products: products),
        ) */
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MEGA STORE',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: NavigationBar(),
        routes: {
          SignUpScreen.routeName: (ctx) => SignUpScreen(),
          MyProfileScreen.routeName: (ctx) => MyProfileScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          ForgotPasswordScreen.routeName: (ctx) => ForgotPasswordScreen(),
          NavigationBar.routeName: (ctx) => NavigationBar(),
          ChooseCategoryScreen.routeName: (ctx) => ChooseCategoryScreen(),
          TileChoosenCategoryScreen.routeName: (ctx) =>
              TileChoosenCategoryScreen(),
          TileFavoritesScreen.routeName: (ctx) => TileFavoritesScreen(),
          GridChoosenCategoryScreen.routeName: (ctx) =>
              GridChoosenCategoryScreen(),
          CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
          FiltersScreen.routeName: (ctx) => FiltersScreen(),
          BrandScreen.routeName: (ctx) => BrandScreen(),
          ProductCardScreen.routeName: (ctx) => ProductCardScreen(),
          MyBagScreen.routeName: (ctx) => MyBagScreen(),
          MyOrdersScreen.routeName: (ctx) => MyOrdersScreen(),
          OrderCheckOutScreen.routeName: (ctx) => OrderCheckOutScreen(),
          OrderDetailScreen.routeName: (ctx) => OrderDetailScreen(),
          SettingsScreen.routeName: (ctx) => SettingsScreen(),
          ChoosingShippingAddressesScreen.routeName: (ctx) =>
              ChoosingShippingAddressesScreen(),
          AddingShippingAddressScreen.routeName: (ctx) =>
              AddingShippingAddressScreen(),
          PaymentMethodsScreen.routeName: (ctx) => PaymentMethodsScreen(),
          AddNewCardScreen.routeName: (ctx) => AddNewCardScreen(),
        },
      ),
    );
  }
}
