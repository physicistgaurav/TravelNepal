import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:matrix_link/main.dart';
import 'package:matrix_link/pages/BottomNavigation.dart';
import 'package:matrix_link/pages/login_page.dart';

class SignupPage extends StatefulWidget {
  static const String routeName = "/signup";
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formkey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset(
          "assets/wbg.jpg",
          fit: BoxFit.cover,
          color: Colors.black.withOpacity(0.1),
          colorBlendMode: BlendMode.difference,
        ),
        Positioned(
          top: 70,
          left: 110,
          child: Image.asset(
            "assets/signup.png",
            width: size.width * 0.5,
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Image.asset(
            "assets/main_top.png",
            width: size.width * 0.35,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset(
            "assets/login_bottom.png",
            width: size.width * 0.4,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          controller: _usernameController,
                          keyboardType: TextInputType.name,
                          // validator: (s){},
                          decoration: InputDecoration(
                              hintText: "Enter username",
                              labelText: "Username"),
                        ),
                        TextFormField(
                          controller: _usernameController,
                          keyboardType: TextInputType.emailAddress,
                          // validator: (s){},
                          decoration: InputDecoration(
                              hintText: "Enter Email", labelText: "Email"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          keyboardType: TextInputType.text,
                          // validator: (s){},
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Enter Password",
                              labelText: "Password"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            formkey.currentState.validate();

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()));
                            // Navigator.pushNamed(
                            //     context, HomePage.routeName);
                          },
                          child: Text("Sign up"),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.purple,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              textStyle: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 55.0),
                          child: Row(
                            children: [
                              Text(
                                "Already have an account? ",
                                textAlign: TextAlign.center,
                              ),
                              GestureDetector(
                                child: Text(
                                  "Sign in",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline),
                                ),
                                onTap: () {
                                  formkey.currentState.validate();

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
