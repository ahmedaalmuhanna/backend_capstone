// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:capstoe_frontend/providers/auth_provider.dart';

import '../models/user.dart';

class SigninPage extends StatefulWidget {
  SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 26, 44, 20),
        title: Center(child: const Text("Sign in")),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/images/cyber-network-1440x2560-internet-6k-18684.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Container(
              margin: new EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Text("Sign in"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          margin: EdgeInsets.all(4.0),
                          child: const Text(
                            "",
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.bold),
                          )),
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.white),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        hintText: 'Username',
                        labelText: 'Username',
                        labelStyle: TextStyle(
                            fontSize: 20.0,
                            color: Color.fromARGB(255, 255, 255, 255)),
                        hintStyle: TextStyle(
                            fontSize: 20.0,
                            color: Color.fromARGB(108, 240, 240, 240)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.teal,
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.security,
                          color: Colors.white,
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 0, 26, 44),
                      ),
                      controller: usernameController,
                      validator: (usernameController) {
                        if (usernameController!.isEmpty) {
                          return "Please fill out the username field";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.white),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                            fontSize: 20.0,
                            color: Color.fromARGB(255, 255, 255, 255)),
                        hintStyle: TextStyle(
                            fontSize: 20.0,
                            color: Color.fromARGB(108, 240, 240, 240)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.teal,
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.password,
                          color: Colors.white,
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 0, 26, 44),
                      ),
                      controller: passwordController,
                      obscureText: true,
                      validator: (passwordController) {
                        if (passwordController!.isEmpty) {
                          return "Please fill out the password field";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        _formKey.currentState!.validate();
                        var isSuccess = await context
                            .read<AuthProvider>()
                            .signin(
                                username: usernameController.text,
                                password: passwordController.text);

                        if (isSuccess) {
                          context.replace("/homepage");
                        }
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.push('/signup');
                      },
                      child: Text(
                        "Sign UP!",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 0, 26, 44)),
                      ),
                    )
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
