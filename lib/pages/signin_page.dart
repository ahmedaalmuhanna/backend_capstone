import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:capstoe_frontend/provider/auth_provider.dart';

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
              margin: new EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Sign In"),
                  TextField(
                    decoration: const InputDecoration(
                        hintText: 'Username',
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(244, 9, 18, 85)))),
                    controller: usernameController,
                  ),
                  TextField(
                    decoration: const InputDecoration(hintText: 'Password'),
                    controller: passwordController,
                    obscureText: true,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      var isSuccess = await context.read<AuthProvider>().signin(
                          username: usernameController.text,
                          password: passwordController.text);

                      if (isSuccess) {
                        context.pop();
                      }
                    },
                    child: const Text("Sign In"),
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
