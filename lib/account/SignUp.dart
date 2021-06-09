
import 'dart:ui';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  bool _passwordVisible = false;
  String password;
//asdasdasa
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50)),
              ),
              child:Form(
                key: _form,
              child: Column(
                children: [
                  Image.asset('images/shot-2.png', width: 250, height: 250),

                  Padding(
                    //TODO: SinUP => First Name
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: ' UserName ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      validator: (String val)
                      {
                        if(val.isEmpty)
                          return "Please enter UserName";
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    //TODO: SinUP => Email
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      validator: (val) {
                        if (val.isEmpty || !val.contains('@'))
                          return 'Invalid email';
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: ' Email  ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    //TODO: SinUP => Password
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      validator: (String value) {
                        password = value;
                        if (value.isEmpty) {
                          return "Please Enter New Password";
                        } else if (value.length < 8) {
                          return "Password must be at least 8 characters long";
                        } else {
                          return null;
                        }
                      },
                      obscureText: !_passwordVisible,
                      controller: _pass,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme
                                .of(context)
                                .primaryColorDark,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        labelText: ' Password  ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    //TODO: SinUP => Confirm Password
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Please Re-Enter New Password";
                        } else if (value.length < 8) {
                          return "Password must be at least 8 characters long";
                        } else if (value != password) {
                          return "Password must be same as above";
                        } else {
                          return null;
                        }
                      },
                      controller: _confirmPass,
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        labelText: ' Confirm Password  ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    //TODO: SinUP => Phone
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: ' your number  ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      validator: (String val)
                      {
                        if(val.isEmpty)
                          return "Please enter your phone";
                        return null;
                      },
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    //TODO: SinUP => Button Create
                    padding: const EdgeInsets.all(10.0),
                    child: MaterialButton(
                      onPressed: () {
                        _form.currentState.validate();
                      },
                      height: 50,
                      minWidth: 200,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      color: Colors.cyan,
                      child: Text(' Create ',
                        style: TextStyle(fontSize: 20, color: Colors.white),),
                    ),
                  ),
                ],
              ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}