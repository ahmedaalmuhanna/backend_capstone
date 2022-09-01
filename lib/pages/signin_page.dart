import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:capstoe_frontend/providers/auth_provider.dart';

import '../models/user.dart';

class SigninPage extends StatelessWidget {
  SigninPage({Key? key}) : super(key: key);
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
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
              height: 300,
              margin: new EdgeInsets.symmetric(horizontal: 20),
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
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.white),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      hintText: 'Username',
                      hintStyle: TextStyle(
                          fontSize: 20.0,
                          color: Color.fromARGB(255, 255, 255, 255)),
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
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.white),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                          fontSize: 20.0,
                          color: Color.fromARGB(255, 255, 255, 255)),
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
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      var isSuccess = await context.read<AuthProvider>().signin(
                          username: usernameController.text,
                          password: passwordController.text);


                      if (isSuccess) {
                        context.push("/");
                      }
                    },
                    child: Text(
                      "Sign In",
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  )
                ],
              ),
            ),
          ),

        ),
      ),
    );
  }
}
