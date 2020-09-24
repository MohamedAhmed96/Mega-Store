import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './my_orders_screen.dart';
import './settings_screen.dart';
import 'package:provider/provider.dart';

import '../provider/my_profile_provider.dart';
import '../provider/nav_bar_wid_tab.dart';
import './sign_up_screen.dart';

class MyProfileScreen extends StatefulWidget {
  static String routeName = '/myProfile';
  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  List<Widget> _widgets = [
    MyOrdersScreen(),
    MyOrdersScreen(),
    MyOrdersScreen(),
    MyOrdersScreen(),
    MyOrdersScreen(),
    SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final current = Provider.of<NavBarWidTab>(context);
    final profile = Provider.of<MyProfileProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.9,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'My profile',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  current.goTo(SignUpScreen(), 4);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: Container(
                    height: 80,
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              'lib/assets/images/image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Matilda Brown',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'matildabrown@mail.com',
                                  style: TextStyle(
                                    color: Colors.grey.withOpacity(0.8),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  height: 400,
                  width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (ctx, index) {
                            return Profile(
                              title: profile.title(index),
                              subTitle: profile.subTitle(index),
                              widget: _widgets[index],
                            );
                          },
                          itemCount: profile.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget widget;
  Profile({
    @required this.title,
    @required this.subTitle,
    @required this.widget,
  });
  @override
  Widget build(BuildContext context) {
    final current = Provider.of<NavBarWidTab>(context);
    return GestureDetector(
      onTap: () {
        current.goTo(widget, 4);
      },
      child: Container(
        height: 80,
        //color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        subTitle,
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.8),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    CupertinoIcons.forward,
                    color: Colors.grey.withOpacity(0.8),
                  ),
                ],
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
