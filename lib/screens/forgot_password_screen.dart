import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/nav_bar_wid_tab.dart';
import 'package:mega_store/screens/login_screen.dart';

//import '../screens/sign_up_screen.dart';
//import '../widgets/login_form.dart';
//import '../widgets/navigation_bar.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static String routeName = '/forgot_password';
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();
  var _error = false;
  final _val = 'midoalemo@gmail.com';
  Icon _suffixIcon;
  @override
  Widget build(BuildContext context) {
    final current =Provider.of<NavBarWidTab>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10, top: 50, bottom: 40),
                child: GestureDetector(
                  onTap: () {
                    current.goTo(LoginScreen(), 4);
                  },
                  child: Icon(
                    CupertinoIcons.back,
                    size: 32,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  bottom: 40,
                ),
                child: Text(
                  'Forgot password',
                  style: TextStyle(
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.bold,
                    fontSize: 34,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  bottom: 10,
                ),
                child: Text(
                  'Please, enter your email address. You will receive a link to create a new password via email.',
                  style: TextStyle(
                    height: 1.5,
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: double.infinity,
                //color: Colors.blue,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          alignment: Alignment.center,
                          height: 80,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color:
                                    _error ? Colors.red : Colors.transparent),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5,
                              )
                            ],
                          ),
                          child: TextFormField(
                            showCursor: true,
                            cursorRadius: Radius.circular(10),
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              print(value);
                            },
                            validator: (value) {
                              if (value == _val) {
                                setState(() {
                                  _suffixIcon = Icon(
                                    Icons.done,
                                    color: Colors.green,
                                  );
                                  _error = false;
                                });
                                return null;
                              } else {
                                setState(() {
                                  _suffixIcon = Icon(
                                    Icons.clear,
                                    color: Colors.red,
                                  );
                                  _error = true;
                                });
                                return 'Not a valid email address';
                              }
                            },
                            focusNode: f2,
                            onFieldSubmitted: (value) {
                              if (value.length >= 1 &&
                                  _formKey.currentState.validate()) {
                                f2.unfocus();
                                FocusScope.of(context).requestFocus(f3);
                              }
                            },
                            style: TextStyle(
                              fontSize: 18,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              suffixIcon: _suffixIcon,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 10, 0, 20),
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                color: Colors.grey.withOpacity(0.7),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Container(
                    alignment: Alignment.center,
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.red,
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 20)
                      ],
                    ),
                    child: Text(
                      'Send',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
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
