// ignore_for_file: prefer_const_constructors

import 'package:capstoe_frontend/models/user.dart';
import 'package:capstoe_frontend/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 26, 44, 20),
          title: Center(child: const Text("Sign Up")),
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
                  // height: 400,
                  margin: new EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
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
                              borderSide:
                                  BorderSide(width: 3, color: Colors.white),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            hintText: 'Coded@joinCoded.com',
                            labelText: 'E-mail',
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
                              Icons.email,
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 0, 26, 44),
                          ),
                          controller: emailController,
                          validator: (emailController) {
                            if (emailController!.isEmpty) {
                              return "Please fill out the email field";
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
                              borderSide:
                                  BorderSide(width: 3, color: Colors.white),
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
                              borderSide:
                                  BorderSide(width: 3, color: Colors.white),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            hintText: 'Password',
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
                            var didLogin = await context
                                .read<AuthProvider>()
                                .signup(User(
                                    username: usernameController.text,
                                    email: emailController.text,
                                    password: passwordController.text));
                            if (didLogin) {
                              context.replace("/homepage");
                            }
                          },
                          child: const Text("Sign Up"),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
}
