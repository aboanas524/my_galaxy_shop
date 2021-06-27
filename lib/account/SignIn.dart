
import 'package:flutter/material.dart';
import 'package:galaxy_shop_1/account/SignUp.dart';
import 'package:galaxy_shop_1/screens/product_overview_screen.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}
//Login
class _SignInState extends State<SignIn> {

  // كونترولر لحفظ قيمة الأميل
  final _emailController = TextEditingController();
  // كونترولر لحفظ قيمة الباسوورد
  final _passwordController = TextEditingController();
  // كونترولر للتحكم بالفالديشن للفورم
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 3), (){return Center(child: Text('fuck me'),);}),
        builder: (ctx, snapShot) {
          return Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: SingleChildScrollView(
                  // لوحة الادخال
                  child: Form(
                    key: _form,
                    child: Column(
                      children: [
                        Image.asset('images/new.jpg', width: 300, height: 300),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          //TODO: Login => Email
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: TextFormField(
                            validator: (val) {
                              if (val.isEmpty || !val.contains('@')||val.contains('.com'))
                                return 'Invalid email';
                              return null;
                            },
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              labelText: ' Email  ',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          //TODO: Login => Password
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: TextFormField(
                            validator: (val) {
                              if (val.isEmpty)
                                return 'Please enter password';
                              return null;
                            },
                            controller: _passwordController,
                            obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                              prefixIcon: Icon(Icons.lock),
                              labelText: ' Password  ',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        //TODO: Button Login
                        Builder(
                          builder: (context) =>
                              MaterialButton(
                                height: 50,
                                minWidth: 200,
                                elevation: 16,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                color: Colors.cyan,
                                child: Text(' Login ',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),),
                                onPressed: () {
                                  if(_form.currentState.validate()==true)
                                    {
                                      Navigator.push(context, MaterialPageRoute(builder: (context){ return ProductsOverviewScreen(0);}));
                                    }
                                  },
                              ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(' Forget Password ',
                            style: TextStyle(textBaseline: TextBaseline
                                .ideographic,
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                                fontSize: 15),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(' I don\'t have an account '),
                            TextButton(
                              //TODO: Login => button create accounts
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return SignUp();
                                    }));
                              },
                              child: Text('Create Account ',
                                style: TextStyle(
                                  textBaseline: TextBaseline.ideographic,
                                  color: Colors.cyan,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          );
        }
    );
  }
}