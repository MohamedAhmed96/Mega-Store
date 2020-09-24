import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();
  var _error = false;
  final _val = 'midoalemo@gmail.com';
  Icon _suffixIcon ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.37,
      width: double.infinity,
      //color: Colors.blue,
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                alignment: Alignment.center,
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                    )
                  ],
                ),
                child: TextFormField(
                  onChanged: (value) {
                    print(value);
                  },
                  //maxLength: 35,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  //autofocus: true,
                  textInputAction: TextInputAction.next,
                  focusNode: f1,
                  onFieldSubmitted: (value) {
                    if (value.length >= 5) {
                      FocusScope.of(context).requestFocus(f2);
                    }
                  },
                  decoration: InputDecoration(
                    /* focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ), */ //to keep border arround textFormField
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      //borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                    labelText: 'Name',
                    labelStyle: TextStyle(
                      color: Colors.grey.withOpacity(0.7),
                    ),
                    //suffixIcon: Icon(Icons.done, color: Colors.green,),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                alignment: Alignment.center,
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      color: _error ? Colors.red : Colors.transparent),
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
                        _suffixIcon = Icon(Icons.done, color: Colors.green,);
                        _error = false;
                      });
                      return null;
                    } else {
                      setState(() {
                        _suffixIcon = Icon(Icons.clear, color: Colors.red,);
                        _error = true;
                      });
                      return 'Not a valid email address';
                    }
                  },
                  focusNode: f2,
                  onFieldSubmitted: (value) {
                    if (value.length >= 1 && _formKey.currentState.validate()) {
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
                    /* suffixIcon: Icon (switch(value){
                      case (value = _val): {
                        return Icon(Icons.done, color: Colors.green,);
                      }
                      break;
                    }), */
                    
                    /* Icon(
                      _error ? Icons.clear : Icons.done,
                      color: _error ? Colors.red : Colors.green,
                    ), */
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 20),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.grey.withOpacity(0.7),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                alignment: Alignment.center,
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                    )
                  ],
                ),
                child: TextFormField(
                  onChanged: (value) {
                    print(value);
                  },
                  focusNode: f3,
                  onFieldSubmitted: (value) {
                    if (value.length >= 5) {
                      f3.unfocus();
                    }
                  },
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  obscureText: true,
                  decoration: InputDecoration(
                    //isDense: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                    labelText: 'Password',
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
    );
  }
}
