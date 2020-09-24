import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

class Arg {
  Widget wid;
  int tab;

  Arg({
    this.wid,
    this.tab,
  }); 
}

class NavBarWidTab with ChangeNotifier{
  var argument = Arg();

  Arg get arg {
    return argument;
  } 

  void goTo(Widget widget, int tab){
    argument.wid = widget;
    argument.tab = tab;
    notifyListeners();
  }
}